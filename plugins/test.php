//<?php
/**
 * com_connect: A Textpattern CMS plugin for mail delivery of contact forms.
 */

// Register tags if necessary.
if (class_exists('\Textpattern\Tag\Registry')) {
    Txp::get('\Textpattern\Tag\Registry')
        ->register('com_connect')
        ->register('com_connect_text')
        ->register('com_connect_email')
        ->register('com_connect_textarea')
        ->register('com_connect_select')
        ->register('com_connect_option')
        ->register('com_connect_checkbox')
        ->register('com_connect_radio')
        ->register('com_connect_file')
        ->register('com_connect_serverinfo')
        ->register('com_connect_secret')
        ->register('com_connect_submit')
        ->register('com_connect_send_article')
        ->register('com_connect_value')
        ->register('com_connect_label')
        ->register('com_connect_fields')
        ->register('com_connect_mime')
        ->register('com_connect_body')
        ->register('com_connect_header')
        ->register('com_connect_if')
        ->register('com_connect_expect');
}

register_callback('com_connect_verify', 'comconnect.submit');

/**
 * Tag: encapsulate a contact form.
 *
 * Triggers the following callbacks:
 *  -> 'comconnect.form' during form rendering so additional fields (e.g. spam honeypots) can be injected.
 *  -> 'comconnect.render' immediately prior to form rendering so other parts of the form content may be altered.
 *  -> 'comconnect.submit' on successful posting of form data. Primarily of use for spam
 *     plugins: they can return a non-zero value to signal that the form should NOT be sent.
 *
 * @param array  $atts  Tag attributes
 * @param string $thing Tag's container content
 */
function com_connect($atts, $thing = '')
{
    global $sitename, $com_connect_flags, $com_connect_from,
        $com_connect_recipient, $com_connect_error, $com_connect_submit,
        $com_connect_form, $com_connect_labels, $com_connect_values, $com_connect_js;

    extract(com_connect_lAtts(array(
        'action'           => '',
        'body_form'        => '',
        'class'            => 'comConnectForm',
        'classes'          => '',
        'copysender'       => 0,
        'delay'            => '5-10',
        'expire'           => 600,
        'form'             => '',
        'from'             => '',
        'from_form'        => '',
        'label'            => null,
        'browser_validate' => 1,
        'redirect'         => '',
        'replyto'          => true,
        'required'         => '1',
        'show_error'       => 1,
        'show_input'       => 1,
        'send_article'     => 0,
        'subject'          => null,
        'subject_form'     => '',
        'to'               => '',
        'to_form'          => '',
        'thanks'           => null,
        'thanks_form'      => '',
    ), $atts));

    $doctype = get_pref('doctype', 'xhtml');

    if (!empty($lang)) {
        $strings = com_connect_load_lang($lang);
        $current = Txp::get('\Textpattern\L10n\Lang')->getStrings();
        $textarray = array_merge($current, $strings);
        Txp::get('\Textpattern\L10n\Lang')->setPack($textarray);
    }

    // Set defaults, in the local language if necessary.
    if ($label === null) {
        $label = gTxt('com_connect_contact');
    }

    if ($subject === null) {
        $subject = gTxt('com_connect_email_subject', array('{site}' => html_entity_decode($sitename,ENT_QUOTES)));
    }

    if ($thanks === null) {
        $thanks = graf(gTxt('com_connect_email_thanks'));
    }

    unset($atts['show_error'], $atts['show_input']);

    $defaultClassNames = array(
        'element'  => 'errorElement',
        'wrapper'  => 'comError',
        'required' => 'comRequired',
        'thanks'   => 'comThanks',
        );

    $com_connect_form_id = md5(serialize($atts) . preg_replace('/[\t\s\r\n]/', '', (string)$thing));
    $com_connect_submit = (ps('com_connect_form_id') == $com_connect_form_id);
    $override_email_charset = (get_pref('override_emailcharset') && is_callable('utf8_decode'));
    $userClassNames = do_list($classes);

    foreach (array_merge($defaultClassNames, $userClassNames) as $classKey => $classValue) {
        if (strpos($classValue, ':') !== false) {
            $classParts = do_list($classValue, ':');

            if (count($classParts) === 2) {
                $com_connect_flags['cls_' . $classParts[0]] = $classParts[1];
            }
        } elseif ($classKey && $classValue) {
            $com_connect_flags['cls_' . $classKey] = $classValue;
        }
    }

    // The $com_connect_flags['this_form'] global is set if an id is supplied for the <form>.
    // This value then becomes the default value for all html_form (a.k.a. form=)
    // attributes for any input tags in this tag's container, providing HTML5 is in use.
    $com_connect_flags['this_form'] = 'com' . $com_connect_form_id;

    // Global toggle for required attribute.
    $com_connect_flags['required'] = $required;

    // Global encoding type. 0 = application/x-www-form-urlencoded, 1 = multipart/form-data
    $com_connect_flags['enctype'] = 0;

    $now = time();
    $now_date = date('Y-m-d H:i:s', $now);

    $expire = abs(assert_int($expire));

    $range = do_list($delay, array(',', '-'));
    $com_connect_flags['delay'] = $range;

    static $headers_sent = false;

    if (!$headers_sent) {
        header('Last-Modified: ' . gmdate('D, d M Y H:i:s', $now - (3600 * 24 * 7)) . ' GMT');
        header('Expires: ' . gmdate('D, d M Y H:i:s', $now + $expire) . ' GMT');
        header('Cache-Control: no-cache, must-revalidate');
        $headers_sent = true;
    }

    $nonce = doSlash(ps('com_connect_nonce'));
    $renonce = false;

    if ($com_connect_submit) {
        // Since multiple com_connect forms could delete data that might be in use by other forms,
        // protect them by using a well-known minimum value of 10 minutes. Not perfect.
        // Using multiple forms on a page will result in them all adopting the lowest expiry time.
        safe_delete('txp_discuss_nonce', "issue_time < date_sub('$now_date', interval ".max(600, $expire)." second)");
        if ($rs = safe_row('used', 'txp_discuss_nonce', "nonce = '$nonce'")) {
            if ($rs['used']) {
                unset($com_connect_error);
                $com_connect_error[] = gTxt('com_connect_form_used');
                $renonce = true;
                $_POST = array();
                $_POST['com_connect_submit'] = true;
                $_POST['com_connect_form_id'] = $com_connect_form_id;
                $_POST['com_connect_nonce'] = $nonce;
            }
        } else {
            $com_connect_error[] = gTxt('com_connect_form_expired');
            $renonce = true;
        }
    }

    if ($com_connect_submit && $nonce && !$renonce) {
        $com_connect_nonce = $nonce;
    } elseif (!$show_error || $show_input) {
        $com_connect_nonce = md5(uniqid(rand(), true));
        safe_insert('txp_discuss_nonce', "issue_time = '" . $now_date . "', nonce = '$com_connect_nonce'");
    }

    $form = ($form) ? fetch_form($form) : $thing;

    if (empty($form)) {
        $br = ($doctype === 'xhtml') ? '<br />' : '<br>';
        $form = '
<txp:com_connect_text label="'.gTxt('com_connect_name').'" />'.$br.
'<txp:com_connect_email />'.$br.
($send_article ? '<txp:com_connect_email send_article="1" label="'.gTxt('com_connect_recipient').'" />'.$br : '').
'<txp:com_connect_textarea />'.$br.
'<txp:com_connect_submit />
';
    }

    $form = parse($form);

    // Perform aggregate functions for checking radio sets.
    if ($com_connect_submit) {
        com_connect_group_validate();
    }

    if ($to_form) {
        $to = parse_form($to_form);
    }

    if (!$to && !$send_article) {
        return gTxt('com_connect_to_missing');
    }

    $out = '';

    if (!$com_connect_submit) {
        // Don't show errors or send mail.
    } elseif (!empty($com_connect_error)) {
        if ($show_error || !$show_input) {
            $out .= n.doWrap(array_unique($com_connect_error), 'ul', 'li', $com_connect_flags['cls_wrapper']).n;

            if (!$show_input) {
                return $out;
            }
        }
    } elseif ($show_input && is_array($com_connect_form)) {
        // Load and check spam plugins.
        callback_event('comconnect.submit');
        $evaluation =& get_comconnect_evaluator();
        $clean = $evaluation->get_comconnect_status();

        if ($clean != 0) {
            return $evaluation->get_comconnect_reason();
        }

        if ($from_form) {
            $from = parse_form($from_form);
        }

        if ($subject_form) {
            $subject = parse_form($subject_form);
        }

        $sep = IS_WIN ? "\r\n" : "\n";
        $msg = array();
        $fields = array();

        foreach ($com_connect_labels as $key => $lbl) {
            $com_connect_values[$key] = doArray($com_connect_values[$key], 'trim');

            if ($com_connect_values[$key] === false) {
                continue;
            }

            if (strpos($key, 'com_connect_file_') === false) {
                $msg[] = $lbl . ': ' . (is_array($com_connect_values[$key]) ? implode(',', $com_connect_values[$key]) : $com_connect_values[$key]);
            }

            $fields[$key] = $com_connect_values[$key];
        }

        if ($send_article) {
            global $thisarticle;

            $subject = str_replace('&#38;', '&', $thisarticle['title']);
            $msg[] = permlinkurl($thisarticle);
            $msg[] = $subject;
            $s_ar = array('&#8216;', '&#8217;', '&#8220;', '&#8221;', '&#8217;', '&#8242;', '&#8243;', '&#8230;', '&#8211;', '&#8212;', '&#215;', '&#8482;', '&#174;', '&#169;', '&lt;', '&gt;', '&quot;', '&amp;', '&#38;', "\t", '<p');

            if ($override_email_charset) {
                $r_ar = array("'", "'", '"', '"', "'", "'", '"', '...', '-', '--', 'x', '[tm]', '(r)', '(c)', '<', '>', '"', '&', '&', ' ', "\n<p");
            } else {
                $r_ar = array('‘', '’', '“', '”', '’', '?', '?', '…', '–', '—', '×', '™', '®', '©', '<', '>', '"', '&', '&', ' ', "\n<p");
            }

            $msg[] = trim(strip_tags(str_replace($s_ar, $r_ar, (trim(strip_tags($thisarticle['excerpt'])) ? $thisarticle['excerpt'] : $thisarticle['body']))));

            if (empty($com_connect_recipient)) {
                return gTxt('com_connect_field_missing', array('{field}' => gTxt('com_connect_recipient')));
            } else {
                $to = $com_connect_recipient;
            }
        }

        if ($replyto === true) {
            $reply = com_connect_strip($from ? $com_connect_from : '');
            $from = com_connect_strip($from ? $from : $com_connect_from);
        } elseif ($replyto === false || !is_valid_email($replyto)) {
            $reply = com_connect_strip($from ? $from : '');
            $from = com_connect_strip($from ? $from : '');
        } else {
            $reply = com_connect_strip($replyto);
            $from = com_connect_strip($from ? $from : $replyto);
        }

        $to      = com_connect_strip($to);
        $subject = com_connect_strip($subject);
        $body    = implode("\n\n", $msg);

        if ($body_form) {
            $body = parse_form($body_form);
        }

        $body = str_replace(array("\r\n", "\r", "\n"), array("\n", "\n", $sep), $body);
        $body = com_connect_strip($body, false);

        $bodyContent['html'] = empty($com_connect_flags['body_html']) ? '' : $com_connect_flags['body_html'];

        if (empty($com_connect_flags['body_plain']) && !empty($com_connect_flags['body_html'])) {
            $bodyContent['plain'] = strip_tags($com_connect_flags['body_html']);
        } else {
            $bodyContent['plain'] = empty($com_connect_flags['body_plain']) ? $body : $com_connect_flags['body_plain'];
        }

        safe_update('txp_discuss_nonce', "used = '1', issue_time = '$now_date'", "nonce = '$nonce'");

        if (com_connect_deliver($from, $to, $reply, $subject, $bodyContent, $fields, array('isCopy' => false, 'redirect' => $redirect))) {
            $_POST = array();

            if ($copysender && $com_connect_from) {
                com_connect_deliver($from, com_connect_strip($com_connect_from), $reply, $subject, $bodyContent, $fields, array('isCopy' => true, 'redirect' => $redirect));
            }

            if ($redirect) {
                while (@ob_end_clean());
                $uri = hu.ltrim($redirect,'/');

                if (empty($_SERVER['FCGI_ROLE']) && empty($_ENV['FCGI_ROLE'])) {
                    txp_status_header('303 See Other');
                    header('Location: '.$uri);
                    header('Connection: close');
                    header('Content-Length: 0');
                } else {
                    $uri = txpspecialchars($uri);
                    $refresh = gTxt('com_connect_refresh');
                    echo <<<END
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>$sitename</title>
    <meta http-equiv="refresh" content="0;url=$uri">
</head>
<body>
    <a href="$uri">$refresh</a>
</body>
</html>
END;
                }

                exit;
            } else {
                return '<div class="' . $com_connect_flags['cls_thanks'] . '" id="com'.$com_connect_form_id.'">' .
                    ($thanks_form ? parse_form($thanks_form) : $thanks) .
                    '</div>';
            }
        } else {
            // Plugin modules may have set error messages: display if appropriate.
            if ($com_connect_error) {
                $out .= n.doWrap(array_unique($com_connect_error), 'ul', 'li', $com_connect_flags['cls_wrapper']).n;
            } else {
                $out .= graf(gTxt('com_connect_mail_sorry'));
            }
        }
    }

    if ($show_input && !$send_article || gps('com_connect_send_article')) {
        $fragment = '#com' . $com_connect_form_id;
        $req_uri = txpspecialchars(serverSet('REQUEST_URI'));

        if ($action) {
            $endpoints = (array)doArray(do_list($action), 'txpspecialchars');
            $destination = $endpoints[0];

            if (count($endpoints) === 2) {
                $jsRange = json_encode($range);
                $encodedDestination = base64_encode((empty($endpoints[1]) ? $req_uri : $endpoints[1]) . $fragment);

                // 32 chars should be enough entropy to guarantee at least one non-numeric character.
                $varname = preg_replace('/\d/', '', Txp::get('\Textpattern\Password\Random')->generate(32));
                $com_connect_js['action'] = <<<EOJS
setTimeout(function() {
    let {$varname} = document.getElementById('com{$com_connect_form_id}');
    {$varname}.action = atob('{$encodedDestination}');
}, {$jsRange}[{$jsRange}.length * Math.random() | 0] * 1000);
EOJS;
            }
        } else {
            $destination = $req_uri;
        }

        $contactForm = '<form method="post"' . ((!$show_error && $com_connect_error) ? '' : ' id="com' . $com_connect_form_id . '"') .
            ($class ? ' class="' . $class . '"' : '') .
            ($browser_validate ? '' : ' novalidate') .
            ' action="' . $destination . $fragment . '">' .
            ($label ? n . '<fieldset>' : '') .
            ($label ? n . '<legend>' . txpspecialchars($label) . '</legend>' : '') .
            $out .
            n . '<input type="hidden" name="com_connect_nonce" value="' . $com_connect_nonce . '"' . (($doctype === 'xhtml') ? ' />' : '>') .
            n . '<input type="hidden" name="com_connect_form_id" value="' . $com_connect_form_id . '"' . (($doctype === 'xhtml') ? ' />' : '>') .
            $form .
            callback_event('comconnect.form') .
            ($label ? (n . '</fieldset>') : '') .
            n . '</form>';

        if ($com_connect_js) {
            $concat = implode(n, $com_connect_js);
            $contactForm .= script_js(<<<EOJS
document.addEventListener("DOMContentLoaded", () => {
    let theForm = document.getElementById('com{$com_connect_form_id}');
    theForm.addEventListener("focusin", (ev) => {
    {$concat}
}, { once: true })
});
EOJS
            );
        }

        callback_event_ref('comconnect.render', '', 0, $contactForm, $atts);

        return $contactForm;
    }

    return '';
}

/**
 * Tag: Render a text input field.
 *
 * Many different $types are allowed. In fact, the $type attribute is not
 * restricted in any way to allow for any future types. This does bring some
 * developer responsibility if you wish your document to validate because
 * not all attributes will be valid for all input types, despite the plugin
 * faithfully rendering whatever attributes it is given.
 *
 * A lot of invalid situations are recognised (e.g. only permitting max/min/step
 * to occur on 'numeric' input types) but some are not easily trappable so they
 * are left to user discretion.
 *
 * @param  array  $atts Tag attributes
 * @return string HTML
 */
function com_connect_text($atts)
{
    global $com_connect_error, $com_connect_submit, $com_connect_flags, $com_connect_js;

    extract(com_connect_lAtts(array(
        'autocomplete'   => '',
        'break'          => 'br',
        'class'          => 'comText',
        'default'        => '',
        'delay'          => null,
        'expected'       => null,
        'html_form'      => $com_connect_flags['this_form'],
        'isError'        => '',
        'inputmode'      => '',
        'label'          => gTxt('com_connect_text'),
        'label_position' => 'before',
        'max'            => null,
        'min'            => null,
        'name'           => '',
        'pattern'        => '',
        'placeholder'    => '',
        'required'       => $com_connect_flags['required'],
        'size'           => '',
        'step'           => '',
        'type'           => 'text',
    ), $atts));

    $doctype = get_pref('doctype', 'xhtml');

    $datetime_types = array(
        'date',
        'datetime',
        'datetime-local',
        'month',
        'time',
        'week',
    );

    $numeric_types = array(
        'number',
        'range',
    );

    $is_datetime = (in_array($type, $datetime_types));
    $is_numeric = (in_array($type, $numeric_types));

    // Dates / times get special treatment: no default min/max if not set by tag.
    if (!$is_datetime && $min === null) {
        $min = 0;
    }

    if (!$is_datetime && $max === null) {
        $max = 100;
    }

    if (empty($name)) {
        $name = com_connect_label2name($label);
    }

    $name = sanitizeForUrl($name);

    if ($com_connect_submit) {
        $value = trim(ps($name));

        $utf8len = preg_match_all("/./su", $value, $utf8ar);
        $hlabel = txpspecialchars($label);
        $datetime_ok = true;

        if ($is_datetime) {
            $minval = $min;
            $maxval = $max;
            $cmpval = $value;

            try {
                $dt = new DateTime($cmpval);
                $cmpval = $dt->format('U');

                if ($min) {
                    $dt = new DateTime($min);
                    $minval = $dt->format('U');
                }

                if ($max) {
                    $dt = new DateTime($max);
                    $maxval = $dt->format('U');
                }
            } catch (Exception $e) {
                $datetime_ok = false;
            }
        }

        if (strlen($value)) {
            if (!$utf8len) {
                $com_connect_error[] = gTxt('com_connect_invalid_utf8', array('{field}' => $hlabel));
                $isError = $com_connect_flags['cls_element'];
            } elseif ($is_datetime && !$datetime_ok) {
                $com_connect_error[] = gTxt('com_connect_format_warning', array('{field}' => $hlabel, '{value}' => $value));
                $isError = $com_connect_flags['cls_element'];
            } elseif ($min && !$is_numeric && !$is_datetime && $utf8len < $min) {
                $com_connect_error[] = gTxt('com_connect_min_warning', array('{field}' => $hlabel, '{value}' => $min));
                $isError = $com_connect_flags['cls_element'];
            } elseif ($max && !$is_numeric && !$is_datetime && $utf8len > $max) {
                $com_connect_error[] = gTxt('com_connect_max_warning', array('{field}' => $hlabel, '{value}' => $max));
                $isError = $com_connect_flags['cls_element'];
            } elseif ($min && $is_datetime && $cmpval < $minval) {
                $com_connect_error[] = gTxt('com_connect_minval_warning', array('{field}' => $hlabel, '{value}' => $min));
                $isError = $com_connect_flags['cls_element'];
            } elseif ($max && $is_datetime && $cmpval > $maxval) {
                $com_connect_error[] = gTxt('com_connect_maxval_warning', array('{field}' => $hlabel, '{value}' => $max));
                $isError = $com_connect_flags['cls_element'];
            } elseif ($min && $is_numeric && $value < $min) {
                $com_connect_error[] = gTxt('com_connect_minval_warning', array('{field}' => $hlabel, '{value}' => $min));
                $isError = $com_connect_flags['cls_element'];
            } elseif ($max && $is_numeric && $value > $max) {
                $com_connect_error[] = gTxt('com_connect_maxval_warning', array('{field}' => $hlabel, '{value}' => $max));
                $isError = $com_connect_flags['cls_element'];
            } elseif ($pattern and !preg_match('/^'.$pattern.'$/', $value)) {
                $com_connect_error[] = gTxt('com_connect_pattern_warning', array('{field}' => $hlabel, '{value}' => $pattern));
                $isError = $com_connect_flags['cls_element'];
            } else {
                com_connect_store($name, $label, $value, $expected);
            }
        } elseif ($required) {
            $com_connect_error[] = gTxt('com_connect_field_missing', array('{field}' => $hlabel));
            $isError = $com_connect_flags['cls_element'];
        }
    } else {
        $value = $default;
    }

    // Core attributes.
    $attr = com_connect_build_atts(array(
        'id'    => (isset($id) ? $id : $name),
        'name'  => $name,
        'type'  => $type,
        'value' => $value,
    ));

    if ($size && !$is_numeric) {
        $attr['size'] = 'size="' . intval($size) . '"';
    }

    if ($min && !$is_numeric) {
        $attr['minlength'] = 'minlength="' . intval($min) . '"';
    }

    if ($max && !$is_numeric) {
        $attr['maxlength'] = 'maxlength="' . intval($max) . '"';
    }

    if ($doctype !== 'xhtml' && ($is_numeric || $is_datetime)) {
        // Not using intval() because min/max/step can be floating point values.
        $attr += com_connect_build_atts(array(
            'min'  => $min,
            'max'  => $max,
            'step' => $step,
        ));
    }

    // HTML5 attributes.
    $required = ($required) ? 'required' : '';

    if ($doctype !== 'xhtml') {
        $attr += com_connect_build_atts(array(
            'autocomplete' => $autocomplete,
            'form'         => $html_form,
            'inputmode'    => $inputmode,
            'pattern'      => $pattern,
            'placeholder'  => $placeholder,
            'required'     => $required,
        ));

        if ($isError) {
            $attr += com_connect_build_atts(array(
                'aria-invalid' => 'true',
            ));
        }
    }

    // Global attributes.
    $attr += com_connect_build_atts($com_connect_globals, $atts);

    $classes = array();

    foreach (array($class, ($required ? $com_connect_flags['cls_required'] : ''), $isError) as $cls) {
        if ($cls) {
            $classes[] = $cls;
        }
    }

    $classStr = ($classes ? ' class="' . implode(' ', $classes) . '"' : '');
    $labelStr = ($label) ? '<label for="' . $name . '"' . $classStr . '>' . txpspecialchars($label) . '</label>' : '';

    $out = ($labelStr && $label_position === 'before' ? $labelStr . $break : '') .
        '<input' . $classStr . ($attr ? ' ' . implode(' ', $attr) : '') . (($doctype === 'xhtml') ? ' />' : '>') .
        ($labelStr && $label_position === 'after' ? $break . $labelStr : '');

    if ($delay) {
        // 32 chars should be enough entropy to guarantee at least one non-numeric character.
        $varname = preg_replace('/\d/', '', Txp::get('\Textpattern\Password\Random')->generate(32));
        $positions = array('beforeend', 'afterbegin');
        $range = $delay === true ? $com_connect_flags['delay'] : do_list((string)$delay, array(',', '-'));
        $jsRange = json_encode($range);

        $com_connect_js[] = <<<EOJS
setTimeout(function() {
    let {$varname} = document.getElementById("{$com_connect_flags['this_form']}");
    {$varname}.insertAdjacentHTML('{$positions[array_rand($positions)]}', '{$out}');
}, ({$jsRange}[{$jsRange}.length * Math.random() | 0]) * 1000);
EOJS;
        com_connect_expect(array(
            'name'  => $name,
            'value' => $expected,
        ));
    } else {
        return $out;
    }
}

/**
 * Tag: Render an email input field.
 *
 * @param  array  $atts Tag attributes
 * @return string HTML
 */
function com_connect_email($atts)
{
    global $com_connect_error, $com_connect_submit, $com_connect_from, $com_connect_recipient, $com_connect_flags;

    // TODO: 'multiple' attribute?
    $defaults = array(
        'autocomplete'   => '',
        'break'          => 'br',
        'class'          => 'comEmail',
        'default'        => '',
        'html_form'      => $com_connect_flags['this_form'],
        'isError'        => '',
        'label'          => gTxt('com_connect_email'),
        'label_position' => 'before',
        'max'            => 100,
        'min'            => 0,
        'name'           => '',
        'pattern'        => '',
        'placeholder'    => '',
        'required'       => $com_connect_flags['required'],
        'send_article'   => 0,
        'size'           => '',
        'type'           => 'email',
    );

    extract(com_connect_lAtts($defaults, $atts));

    if (empty($name)) {
        $name = com_connect_label2name($label);
    }

    $name = sanitizeForUrl($name);
    $email = $com_connect_submit ? trim(ps($name)) : $default;

    if ($com_connect_submit && strlen($email)) {
        if (!is_valid_email($email)) {
            $com_connect_error[] = gTxt('com_connect_invalid_email', array('{email}' => txpspecialchars($email)));
            $isError = $com_connect_flags['cls_element'];
        } else {
            preg_match("/@(.+)$/", $email, $match);
            $domain = $match[1];

            if (is_callable('checkdnsrr') && checkdnsrr('textpattern.com.','A') && !checkdnsrr($domain.'.','MX') && !checkdnsrr($domain.'.','A')) {
                $com_connect_error[] = gTxt('com_connect_invalid_host', array('{host}' => txpspecialchars($domain)));
                $isError = $com_connect_flags['cls_element'];
            } else {
                if ($send_article) {
                    $com_connect_recipient = $email;
                } else {
                    $com_connect_from = $email;
                }
            }
        }
    }

    $passed_atts = array();

    foreach ($defaults as $key => $value) {
        $passed_atts[$key] = $$key;
    }

    $passed_atts['isError'] = $isError;
    unset ($passed_atts['send_article']);

    return com_connect_text($passed_atts);
}

/**
 * Tag: Render a textarea input field.
 *
 * @param  array  $atts Tag attributes
 * @return string HTML
 */
function com_connect_textarea($atts)
{
    global $com_connect_error, $com_connect_submit, $com_connect_flags;

    extract(com_connect_lAtts(array(
        'autocomplete'   => '',
        'break'          => 'br',
        'class'          => 'comTextarea',
        'cols'           => 58,
        'default'        => '',
        'html_form'      => $com_connect_flags['this_form'],
        'isError'        => '',
        'label'          => gTxt('com_connect_message'),
        'label_position' => 'before',
        'max'            => 10000,
        'min'            => 0,
        'name'           => '',
        'placeholder'    => '',
        'required'       => $com_connect_flags['required'],
        'rows'           => 8,
        'wrap'           => '',
    ), $atts));

    $min = intval($min);
    $max = intval($max);

    if (empty($name)) {
        $name = com_connect_label2name($label);
    }

    $name = sanitizeForUrl($name);
    $doctype = get_pref('doctype', 'xhtml');

    if ($com_connect_submit) {
        $value = preg_replace('/^\s*[\r\n]/', '', rtrim(ps($name)));
        $utf8len = preg_match_all("/./su", ltrim($value), $utf8ar);
        $hlabel = txpspecialchars($label);

        if (strlen(ltrim($value))) {
            if (!$utf8len) {
                $com_connect_error[] = gTxt('com_connect_invalid_utf8', array('{field}' => $hlabel));
                $isError = $com_connect_flags['cls_element'];
            } elseif ($min && $utf8len < $min) {
                $com_connect_error[] = gTxt('com_connect_min_warning', array('{field}' => $hlabel, '{value}' => $min));
                $isError = $com_connect_flags['cls_element'];
            } elseif ($max && $utf8len > $max) {
                $com_connect_error[] = gTxt('com_connect_max_warning', array('{field}' => $hlabel, '{value}' => $max));
                $isError = $com_connect_flags['cls_element'];
            } else {
                com_connect_store($name, $label, $value);
            }
        } elseif ($required) {
            $com_connect_error[] = gTxt('com_connect_field_missing', array('{field}' => $hlabel));
            $isError = $com_connect_flags['cls_element'];
        }
    } else {
        $value = $default;
    }

    // Core attributes.
    $attr = com_connect_build_atts(array(
        'id'        => (isset($id) ? $id : $name),
        'name'      => $name,
        'cols'      => intval($cols),
        'rows'      => intval($rows),
        'maxlength' => $max,
    ));

    // HTML5 attributes.
    $required = ($required) ? 'required' : '';

    if ($doctype !== 'xhtml') {
        $attr += com_connect_build_atts(array(
            'autocomplete' => $autocomplete,
            'form'         => $html_form,
            'placeholder'  => $placeholder,
            'required'     => $required,
        ));

        if ($isError) {
            $attr += com_connect_build_atts(array(
                'aria-invalid' => 'true',
            ));
        }
    }

    // Global attributes.
    $attr += com_connect_build_atts($com_connect_globals, $atts);

    $classes = array();

    foreach (array($class, ($required ? $com_connect_flags['cls_required'] : ''), $isError) as $cls) {
        if ($cls) {
            $classes[] = $cls;
        }
    }

    $classStr = ($classes ? ' class="' . implode(' ', $classes) . '"' : '');
    $labelStr = ($label) ? '<label for="' . $name . '"' . $classStr . '>' . txpspecialchars($label) . '</label>' : '';

    return ($labelStr && $label_position === 'before' ? $labelStr . $break : '') .
        '<textarea' . $classStr . ($attr ? ' ' . implode(' ', $attr) : '') . '>' . txpspecialchars($value) . '</textarea>' .
        ($labelStr && $label_position === 'after' ? $break . $labelStr : '');
}

/**
 * Tag: Render a select/option input list.
 *
 * @param  array  $atts Tag attributes
 * @param  string $thing Tag's container content
 * @return string HTML
 */
function com_connect_select($atts, $thing = '')
{
    global $com_connect_error, $com_connect_submit, $com_connect_flags;

    extract(com_connect_lAtts(array(
        'break'          => 'br',
        'class'          => 'comSelect',
        'delimiter'      => ',',
        'html_form'      => $com_connect_flags['this_form'],
        'isError'        => '',
        'label'          => gTxt('com_connect_option'),
        'label_position' => 'before',
        'list'           => '', // TODO: remove from here in favour of the global list attribute.
        'multiple'       => '',
        'options'        => gTxt('com_connect_general_inquiry'),
        'name'           => '',
        'required'       => $com_connect_flags['required'],
        'selected'       => '',
        'size'           => '',
    ), $atts));

    // Detect old-school use of the list attribute. Note that deprecated_function_with
    // isn't strictly the correct error to throw, but it's close enough until core has
    // a dedicated deprecated_attribute_with string.
    if (!empty($list) && strpos($list, $delimiter) !== false) {
        $options = $list;
        trigger_error(gTxt('deprecated_function_with', array('{name}' => 'list', '{with}' => 'options')), E_USER_NOTICE);
        unset($list, $atts['list']);
    }

    if (empty($name)) {
        $name = com_connect_label2name($label);
    }

    $name = sanitizeForUrl($name);
    $value = ($com_connect_submit) ? (array)doArray(ps($name), 'trim') : do_list_unique($selected);
    $doctype = get_pref('doctype', 'xhtml');

    if ($thing) {
        com_connect_option(null, $value);
        $out = parse($thing);
        $options = com_connect_option(null, null);
    } else {
        $options = array_map('trim', explode($delimiter, preg_replace('/[\r\n\t\s]+/', ' ', $options)));
        $out = '';

        foreach ($options as $item) {
            $safeItem = txpspecialchars($item);
            $val = '';

            if (preg_match('@^\{(.*)\}$@', $safeItem, $emptyLabel)) {
                $val = ' value="" label="' . $emptyLabel[1] . '"';
                $safeItem = '';
            }

            $sel = (in_array($safeItem, $value)) ? ' selected' . (($doctype === 'xhtml') ? '="selected"' : '') : '';

            $out .= n.t.'<option' . $sel . $val . '>' . (strlen($safeItem) ? $safeItem : '') . '</option>';
        }
    }

    if ($com_connect_submit) {
        if ($value) {
            if (com_connect_in_array($value, $options)) {
                com_connect_store($name, $label, $value);
            } else {
                $val = doArray($value, 'txpspecialchars');
                $com_connect_error[] = gTxt('com_connect_invalid_value', array('{field}' => txpspecialchars($label), '{value}' => is_array($val) ? $val[0] : $val));
                $isError = $com_connect_flags['cls_element'];
            }
        } elseif ($required) {
            $com_connect_error[] = gTxt('com_connect_field_missing', array('{field}' => txpspecialchars($label)));
            $isError = $com_connect_flags['cls_element'];
        }
    } else {
        $value = $selected;
    }

    // Core attributes.
    $attr = com_connect_build_atts(array(
        'id'       => (isset($id) ? $id : $name),
        'name'     => $name.($multiple ? '[]' : ''),
        'multiple' => $multiple,
    ));

    if ($size && is_numeric($size)) {
        $attr['size'] = 'size="' . intval($size) . '"';
    }

    // HTML5 attributes.
    $required = ($required) ? 'required' : '';
    if ($doctype !== 'xhtml') {
        $attr += com_connect_build_atts(array(
            'form'     => $html_form,
            'required' => $required,
        ));

        if ($isError) {
            $attr += com_connect_build_atts(array(
                'aria-invalid' => 'true',
            ));
        }
    }

    // Global attributes.
    $attr += com_connect_build_atts($com_connect_globals, $atts);

    $classes = array();

    foreach (array($class, ($required ? $com_connect_flags['cls_required'] : ''), $isError) as $cls) {
        if ($cls) {
            $classes[] = $cls;
        }
    }

    $classStr = ($classes ? ' class="' . implode(' ', $classes) . '"' : '');
    $labelStr = ($label) ? '<label for="' . $name . '"' . $classStr . '>' . txpspecialchars($label) . '</label>' : '';

    return ($labelStr && $label_position === 'before' ? $labelStr . $break : '') .
        n . '<select' . $classStr . ($attr ? ' ' . implode(' ', $attr) : '') . '>' .
            $out .
        n . '</select>' .
        ($labelStr && $label_position === 'after' ? $break . $labelStr : '');
}

/**
 * Tag: Render a set of select options.
 *
 * @param  array  $atts  Tag attributes
 * @param  string $thing Tag's container
 * @return string HTML
 */
function com_connect_option($atts, $thing = null)
{
    static $options;
    static $match;

    if ($atts === null) {
        if ($thing === null) {
            return $options;
        } else {
            $match = $thing;
            return;
        }
    }

    global $com_connect_error, $com_connect_submit;

    extract(com_connect_lAtts(array(
        'class'    => 'comOption',
        'label'    => null,
        'selected' => null,
        'value'    => null,
    ), $atts));

    $val = ($value === null) ? (!empty($thing) ? $thing : (!empty($label) ? $label : null)) : $value;
    $label = ($label === null) ? (!empty($thing) ? $thing : (!empty($value) ? $value : null)) : $label;

    $attr = array();
    $doctype = get_pref('doctype', 'xhtml');

    if ($com_connect_submit) {
        $options[] = $val;

        if ($val !== null && (in_array((string)$val, (array)$match))) {
            $attr[] = 'selected' . (($doctype === 'xhtml') ? '="selected"' : '');
        }
    } elseif ($selected || ($val !== null && (in_array((string)$val, (array)$match)))) {
        $attr[] = 'selected' . (($doctype === 'xhtml') ? '="selected"' : '');
    }

    $defaults = array();

    if (preg_match('@^\{(.*)\}$@', $label, $emptyLabel)) {
        $val = $defaults['value'] = "";
        $defaults['label'] = $emptyLabel[1];
        $label = '';
    }

    // Core attributes.
    $attr += com_connect_build_atts(array(
        'value' => $val,
        'label' => $label,
    ), $defaults);

    // Global attributes.
    $attr += com_connect_build_atts($com_connect_globals, $atts);

    $classStr = (($class) ? ' class="' . $class . '"' : '');

    return '<option' . $classStr . ($attr ? ' ' . implode(' ', $attr) : '') . '>' . txpspecialchars($label) . '</option>';
}

/**
 * Tag: Render a checkbox.
 *
 * @param  array  $atts  Tag attributes
 * @return string HTML
 * @todo checkbox groups?
 */
function com_connect_checkbox($atts)
{
    global $com_connect_error, $com_connect_submit, $com_connect_flags;

    extract(com_connect_lAtts(array(
        'break'          => ' ',
        'checked'        => 0,
        'class'          => 'comCheckbox',
        'html_form'      => $com_connect_flags['this_form'],
        'isError'        => '',
        'label'          => gTxt('com_connect_checkbox'),
        'label_position' => 'after',
        'name'           => '',
        'required'       => $com_connect_flags['required'],
        'value'          => null,
    ), $atts));

    if (empty($name)) {
        $name = com_connect_label2name($label);
    }

    $name = sanitizeForUrl($name);
    $doctype = get_pref('doctype', 'xhtml');

    if ($com_connect_submit) {
        $theValue = (bool) ps($name);

        if ($required && !$theValue) {
            $com_connect_error[] = gTxt('com_connect_field_missing', array('{field}' => txpspecialchars($label)));
            $isError = $com_connect_flags['cls_element'];
        } else {
            $toStore = (($value !== null && $theValue) ? $value : ($theValue ? gTxt('yes') : gTxt('no')));
            com_connect_store($name, $label, $toStore);
        }
    } else {
        $theValue = $checked;
    }

    // Core attributes.
    $attr = com_connect_build_atts(array(
        'id'    => (isset($id) ? $id : $name),
        'name'  => $name,
    ));

    if ($value !== null) {
        $attr += com_connect_build_atts(array(
            'value' => $value,
        ));
    }

    // HTML5 attributes.
    $required = ($required) ? 'required' : '';

    if ($doctype !== 'xhtml') {
        $attr += com_connect_build_atts(array(
            'form'     => $html_form,
            'required' => $required,
        ));

        if ($isError) {
            $attr += com_connect_build_atts(array(
                'aria-invalid' => 'true',
            ));
        }
    }

    // Global attributes.
    $attr += com_connect_build_atts($com_connect_globals, $atts);

    $classes = array();

    foreach (array($class, ($required ? $com_connect_flags['cls_required'] : ''), $isError) as $cls) {
        if ($cls) {
            $classes[] = $cls;
        }
    }

    $classStr = ($classes ? ' class="' . implode(' ', $classes) . '"' : '');
    $labelStr = ($label) ? '<label for="' . $name . '"' . $classStr . '>' . txpspecialchars($label) . '</label>' : '';

    return ($labelStr && $label_position === 'before' ? $labelStr . $break : '') .
        '<input type="checkbox"' . $classStr .
            ($theValue ? ' checked' . (($doctype === 'xhtml') ? '="checked"' : '') : '') . ($attr ? ' ' . implode(' ', $attr) : '') . (($doctype === 'xhtml') ? ' />' : '>') .
        ($labelStr && $label_position === 'after' ? $break . $labelStr : '');
}

/**
 * Tag: Render a radio button.
 *
 * @param  array  $atts  Tag attributes
 * @return string HTML
 */
function com_connect_radio($atts)
{
    global $com_connect_error, $com_connect_submit, $com_connect_values, $com_connect_flags, $com_connect_group;

    extract(com_connect_lAtts(array(
        'break'          => ' ',
        'checked'        => 0,
        'class'          => 'comRadio',
        'group'          => '',
        'html_form'      => $com_connect_flags['this_form'],
        'isError'        => '',
        'label'          => gTxt('com_connect_option'),
        'label_position' => 'after',
        'name'           => '',
        'required'       => null,
        'value'          => null,
    ), $atts));

    static $cur_name = array();
    static $cur_req = array();
    static $cur_group = null;

    if (!$group) {
        if ($cur_group === null) {
            $group = gTxt('com_connect_radio');
        } else {
            $group = $cur_group;
        }
    } else {
        if (!$name) {
            $name = $group;
        }
    }

    if (isset($cur_name[$group])) {
        if (!$name) {
            $name = $cur_name[$group];
        }
    } else {
        if ($name) {
            $cur_name[$group] = $name;
        } else {
            $name = $cur_name[$group] = gTxt('com_connect_radio');
        }
    }

    if (isset($cur_req[$group])) {
        if ($required === null) {
            $required = $cur_req[$group];
        }
    } else {
        if ($required === null) {
            $required = $cur_req[$group] = $com_connect_flags['required'];
        } else {
            $cur_req[$group] = $required;
        }
    }

    $cur_group = $group;

    $id = 'q' . md5($name . '=>' . $label);
    $name = com_connect_label2name($name);
    $name = sanitizeForUrl($name);
    $doctype = get_pref('doctype', 'xhtml');
    $com_connect_group[$name][$id]['req'] = $required;
    $com_connect_group[$name][$id]['label'] = $group;

    if ($com_connect_submit) {
        $toCompare = ($value === null ? $id : $value);
        $is_checked = (ps($name) == $toCompare);
        $com_connect_group[$name][$id]['isSet'] = $is_checked;

        if ($is_checked || $checked && !isset($com_connect_values[$name])) {
            com_connect_store($name, $group, ($value !== null ? $value : $label));
        }
    } else {
        $is_checked = $checked;
    }

    // Core attributes.
    $attr = com_connect_build_atts(array(
        'id'    => $id,
        'name'  => $name,
        'value' => ($value !== null ? $value : $id),
    ));

    // HTML5 attributes.
    $required = ($required) ? 'required' : '';

    if ($doctype !== 'xhtml') {
        $attr += com_connect_build_atts(array(
            'form'     => $html_form,
            'required' => $required,
        ));
    }

    // Global attributes.
    $attr += com_connect_build_atts($com_connect_globals, $atts);

    $classes = array();

    foreach (array($class, ($required ? $com_connect_flags['cls_required'] : ''), $isError) as $cls) {
        if ($cls) {
            $classes[] = $cls;
        }
    }

    $classStr = ($classes ? ' class="' . implode(' ', $classes) . '"' : '');
    $labelStr = ($label) ? '<label for="' . $id . '"' . $classStr . '>' . txpspecialchars($label) . '</label>' : '';

    return ($labelStr && $label_position === 'before' ? $labelStr . $break : '') .
        '<input type="radio"'. $classStr . ($attr ? ' ' . implode(' ', $attr) : '') .
            ( $is_checked ? ' checked' . (($doctype === 'xhtml') ? '="checked"' : '') : '') . (($doctype === 'xhtml') ? ' />' : '>') .
        ($labelStr && $label_position === 'after' ? $break . $labelStr : '');
}

/**
 * Tag: Render a file input field.
 *
 * @param  array  $atts Tag attributes
 * @return string HTML
 */
function com_connect_file($atts)
{
    global $com_connect_error, $com_connect_submit, $com_connect_flags;

    $max_upload_size = com_connect_file_max();

    extract(com_connect_lAtts(array(
        'accept'         => '',
        'break'          => 'br',
        'class'          => 'comFile',
        'html_form'      => $com_connect_flags['this_form'],
        'isError'        => '',
        'label'          => gTxt('com_connect_file'),
        'label_position' => 'before',
        'max'            => $max_upload_size,
        'multiple'       => '',
        'name'           => '',
        'required'       => $com_connect_flags['required'],
        'type'           => 'file',
    ), $atts));

    $doctype = get_pref('doctype', 'xhtml');
    $com_connect_flags['enctype'] = 1;

    // Convert to bytes if not already
    $max = com_connect_parse_size($max);

    if (empty($name)) {
        $name = com_connect_label2name($label);
    }

    $name = sanitizeForUrl($name);

    if (empty($_FILES) && empty($_POST) && isset($_SERVER['REQUEST_METHOD']) && strtolower($_SERVER['REQUEST_METHOD']) === 'post') {
        // Pretend it submitted okay, to render errors.
        $com_connect_submit = 1;
    }

    if ($com_connect_submit) {
        $hlabel = txpspecialchars($label);

        if (array_key_exists($name, $_FILES)) {
            $fileBlock = com_connect_standardize_files($_FILES[$name]);
            $acceptableTypes = $accept ? doArray(do_list($accept), 'trim') : array();
            $acceptableMime = $acceptableExt = array();

            // Build arrays of acceptable file extensions/mime types.
            foreach ($acceptableTypes as $type) {
                if (strpos($type, '.') === 0) {
                    // File extension, minus leading dot.
                    $acceptableExt[] = str_replace('.', '', $type);
                } else {
                    // Assume mime type. Remove wildcards.
                    $acceptableMime[] = str_replace('*', '', $type);
                }
            }

            // Validate each incoming file as best we can.
            foreach ($fileBlock as $fileInfo) {
                $safeName = sanitizeForFile($fileInfo['name']);

                if (empty($safeName) || !isset($fileInfo['error']) || is_array($fileInfo['error'])) {
                    continue;
                }

                switch ($fileInfo['error']) {
                    case UPLOAD_ERR_INI_SIZE:
                    case UPLOAD_ERR_FORM_SIZE:
                        $com_connect_error[] = gTxt('com_connect_maxval_warning', array('{field}' => $hlabel . ' (' . $safeName . ')', '{value}' => $max));
                        $isError = "errorElement";
                        break;
                    case UPLOAD_ERR_OK:
                        break;
                    case UPLOAD_ERR_PARTIAL:
                    case UPLOAD_ERR_NO_FILE:
                    case UPLOAD_ERR_NO_TMP_DIR:
                    case UPLOAD_ERR_CANT_WRITE:
                    case UPLOAD_ERR_EXTENSION:
                    default:
                        // Do nothing for now. Option to report in future.
                        break;
                }

                $mimeOK = $extOK = false;

                // If both mime and file extensions are supplied in the accept attribute,
                // they must BOTH pass to move forward.
                if (class_exists('finfo') && !empty($fileInfo['tmp_name']) && $acceptableMime) {
                    $finfo = finfo_open(FILEINFO_MIME_TYPE);
                    $mtype = finfo_file($finfo, $fileInfo['tmp_name']);
                    finfo_close($finfo);

                    $mimeOK = com_connect_strposa($acceptableMime, $mtype);
                } else {
                    $mimeOK = true;
                }

                if ($acceptableExt) {
                    $ext = pathinfo($fileInfo['name'], PATHINFO_EXTENSION);
                    $extOK = com_connect_strposa($acceptableExt, $ext);
                } else {
                    $extOK = true;
                }

                if ($mimeOK && $extOK) {
                    // Not using Txp's temp directory on purpose. System only.
                    $uploadfile = tempnam(sys_get_temp_dir(), hash('sha256', $fileInfo['name'])) . (!empty($ext) ? '.' . $ext : '');

                    if (empty($fileInfo['tmp_name'])) {
                        $com_connect_error[] = gTxt('com_connect_invalid_file', array('{field}' => $hlabel));
                    } else {
                        if (move_uploaded_file($fileInfo['tmp_name'], $uploadfile)) {
                            $fileInfo['filepath'] = $uploadfile;
                            com_connect_store('com_connect_file_' . $name . '_' . $safeName, $label, $fileInfo);
                        } else {
                            $com_connect_error[] = gTxt('com_connect_invalid_type', array('{field}' => $hlabel));
                            $isError = "errorElement";
                        }
                    }
                } else {
                    $com_connect_error[] = gTxt('com_connect_invalid_type', array('{field}' => $hlabel . ' (' . $safeName . ')'));
                    $isError = "errorElement";
                }
            }
        } elseif ($required && empty($_FILES)) {
            $com_connect_error[] = gTxt('com_connect_maxval_warning', array('{field}' => $hlabel, '{value}' => $max));
            $isError = "errorElement";
        } elseif ($required) {
            $com_connect_error[] = gTxt('com_connect_field_missing', array('{field}' => $hlabel));
            $isError = "errorElement";
        }
    }

    // PHP max file size helper. Not infallible but useful.
    $maxhidden = ($max) ? parse('<txp:com_connect_text type="hidden" name="MAX_FILE_SIZE" class="comHidden" min="" max="" default="'.$max.'" required="0" label="" />') : '';
    unset($atts['max']);

    // Core attributes.
    $attr = com_connect_build_atts(array(
        'accept'   => $accept,
        'id'       => (isset($id) ? $id : $name),
        'name'     => $name.($multiple ? '[]' : ''),
        'multiple' => $multiple,
        'type'     => $type,
    ));

    // HTML5 attributes.
    $required = ($required) ? 'required' : '';

    if ($doctype !== 'xhtml') {
        $attr += com_connect_build_atts(array(
            'form'     => $html_form,
            'required' => $required,
        ));
    }

    // Global attributes.
    $attr += com_connect_build_atts($com_connect_globals, $atts);

    $classes = array();

    foreach (array($class, ($required ? 'comRequired' : ''), $isError) as $cls) {
        if ($cls) {
            $classes[] = $cls;
        }
    }

    $classStr = ($classes ? ' class="' . implode(' ', $classes) . '"' : '');
    $labelStr = '<label for="' . $name . '"' . $classStr . '>' . txpspecialchars($label) . '</label>';

    return ($label_position === 'before' ? $labelStr . $break : '') .
        $maxhidden.
        '<input' . $classStr . ($attr ? ' ' . implode(' ', $attr) : '') . (($doctype === 'xhtml') ? ' />' : '>') .
        ($label_position === 'after' ? $break . $labelStr : '');
}

/**
 * Tag: Store server information in the payload.
 *
 * @param  array  $atts  Tag attributes
 */
function com_connect_serverinfo($atts)
{
    global $com_connect_submit;

    extract(com_connect_lAtts(array(
        'label' => '',
        'name'  => '',
    ), $atts));

    if (empty($name)) {
        $name = com_connect_label2name($label);
    }

    $safeName = sanitizeForUrl($name);

    if (strlen($safeName) && $com_connect_submit) {
        if (!$label) {
            $label = $safeName;
        }

        com_connect_store($safeName, $label, serverSet($name));
    }
}

/**
 * Tag: Store a secret value in the payload.
 *
 * @param  array  $atts  Tag attributes
 * @param  string $thing Tag's container content
 */
function com_connect_secret($atts, $thing = '')
{
    global $com_connect_submit;

    extract(com_connect_lAtts(array(
        'label' => gTxt('com_connect_secret'),
        'name'  => '',
        'value' => '',
    ), $atts));

    $name = com_connect_label2name($name ? $name : $label);
    $name = sanitizeForUrl($name);

    if ($com_connect_submit) {
        if ($thing) {
            $value = trim(parse($thing));
        }

        com_connect_store($name, $label, $value);
    }

    return '';
}

/**
 * Tag: Render a submit button.
 *
 * If the container is used, a button tag is rendered, otherwise a
 * standard input type=submit button is rendered.
 *
 * @param  array  $atts  Tag attributes
 * @param  string $thing Tag's container
 * @return string HTML
 */
function com_connect_submit($atts, $thing = '')
{
    global $com_connect_flags;

    extract(com_connect_lAtts(array(
        'class'     => 'comSubmit',
        'html_form' => $com_connect_flags['this_form'],
        'label'     => gTxt('com_connect_send'),
    ), $atts));

    $label = txpspecialchars($label);
    $doctype = get_pref('doctype', 'xhtml');

    $attr = array();

    // HTML5 attributes.
    if ($doctype !== 'xhtml') {
        $attr += com_connect_build_atts(array(
            'form' => $html_form,
        ));
    }

    // Global attributes.
    $attr += com_connect_build_atts($com_connect_globals, $atts);

    // Handle form encoding type.
    if ($com_connect_flags['enctype']) {
        $attr['formenctype'] = 'formenctype="multipart/form-data"';
    }

    $classStr = ($class ? ' class="' . $class . '"' : '');

    if ($thing) {
        return '<button type="submit"' . $classStr . ' name="com_connect_submit" value="' . $label . '"' . ($attr ? ' ' . implode(' ', $attr) : '') . '>' . ($thing ? trim(parse($thing)) : $label) . '</button>';
    } else {
        return '<input type="submit"' . $classStr . ' name="com_connect_submit" value="' . $label . '"' . ($attr ? ' ' . implode(' ', $attr) : '') . (($doctype === 'xhtml') ? ' />' : '>');
    }
}

/**
 * Tag: Render a link to allow someone to forward a page to a friend.
 *
 * @param  array  $atts  Tag attributes
 * @return string HTML
 */
function com_connect_send_article($atts)
{
    if (!isset($_REQUEST['com_connect_send_article'])) {
        $linktext = (empty($atts['linktext'])) ? gTxt('com_connect_send_article') : $atts['linktext'];
        $join = (empty($_SERVER['QUERY_STRING'])) ? '?' : '&';
        $href = $_SERVER['REQUEST_URI'] . $join . 'com_connect_send_article=yes';

        return '<a href="' . txpspecialchars($href) . '" rel="nofollow">' . txpspecialchars($linktext) . '</a>';
    }

    return;
}

/**
 * Replace mime tags with boundary text
 *
 * @param  array  $atts  Tag attributes
 * @param  string $thing Tag's container content
 * @return string        Boundary
 * @deprecated 4.9.0
 * @see com_connect_body
 */
function com_connect_mime($atts, $thing)
{
    trigger_error(gTxt('deprecated_tag'), E_USER_NOTICE);

    return;
}

/**
 * Indicate body content of a particular type
 *
 * @param  array $atts Tag attributes
 * @param string $thing Tag's container content
 */
function com_connect_body($atts, $thing)
{
    global $com_connect_flags;

    extract(lAtts(array(
        'type' => 'text',
    ), $atts));

    switch ($type) {
        case 'text':
            $com_connect_flags['body_plain'] = parse($thing);
            break;
        case 'html':
            $com_connect_flags['body_html'] = parse($thing);
            break;
    }

    return;
}

/**
 * Add custom headers to the payload
 *
 * @param  array $atts Tag attributes
 * @param string $thing Tag's container content
 */
function com_connect_header($atts, $thing = '')
{
    global $com_connect_submit;

    extract(com_connect_lAtts(array(
        'name'  => '',
        'value' => '',
    ), $atts));

    $name = sanitizeForUrl($name);

    if ($com_connect_submit) {
        if ($thing) {
            $value = trim(parse($thing));
        }

        com_connect_store_header($name, $value);
    }

    return '';
}

/**
 * Perform post-processing for aggregate (group) controls like radio sets.
 *
 * @todo Can this be done any neater?
 * @todo Should this be exposed as a callback to allow plugins to extend the functionality?
 */
function com_connect_group_validate()
{
    global $com_connect_group, $com_connect_error;

    $flags = array();

    if ($com_connect_group) {
        foreach ($com_connect_group as $key => $grp) {
            foreach ($grp as $id => $atts) {
                $flags[$key]['label'] = $atts['label'];

                if (!empty($atts['req']) && !isset($flags[$key]['req'])) {
                    $flags[$key]['req'] = 1;
                }

                if (!empty($atts['isSet']) && !isset($flags[$key]['isSet'])) {
                    $flags[$key]['isSet'] = 1;
                }
            }
        }

        foreach ($flags as $key => $data) {
            if (!empty($data['req']) && !isset($data['isSet'])) {
                $com_connect_error[] = gTxt('com_connect_field_missing', array('{field}' => txpspecialchars($data['label'])));
            }
        }
    }
}

/**
 * Process tag attributes and set defaults.
 *
 * Handles HTML 'global' attributes too, though what we consider global differs slightly
 * from the W3C: any attributes that apply to most of the <input> tags is considered
 * global. Just saves repetitive code in each tag handler.
 *
 * Note that 'class' is omitted, because that has different default values per input
 * widget, so it is dealt with explicitly in each tag handler.
 *
 * @param  array $arr  Acceptable tag attributes
 * @param  array $atts User-submitted attribute values
 * @return array
 */
function com_connect_lAtts($pairs, $atts)
{
    $doctype = get_pref('doctype', 'xhtml');

    foreach (array('button', 'copysender', 'checked', 'required', 'send_article', 'show_input', 'show_error') as $key) {
        if (isset($atts[$key])) {
            $atts[$key] = ($atts[$key] === 'yes' || intval($atts[$key])) ? 1 : 0;
        }
    }

    if ((isset($atts['break']) && $atts['break'] === 'br') ||
        (!isset($atts['break']) && isset($pairs['break']) && $pairs['break'] === 'br')) {
        $atts['break'] = ($doctype === 'xhtml') ? '<br />' : '<br>';
    }

    $com_connect_globals = array(
        'accesskey'      => '',
        'autocapitalize' => '',
        'autofocus'      => '',
        'dir'            => '',
        'disabled'       => '',
        'hidden'         => '',
        'id'             => '',
        'lang'           => '',
        'list'           => '',
        'readonly'       => '',
        'role'           => '',
        'spellcheck'     => '',
        'style'          => '',
        'tabindex'       => '',
        'title'          => '',
        'translate'      => '',
    );

    foreach ($atts as $name => $value) {
        if (array_key_exists($name, $pairs) || substr($name, 0, 2) === 'on' || array_key_exists($name, $com_connect_globals)) {
            $pairs[$name] = $value;
        } elseif (get_pref('production_status') != 'live') {
            trigger_error(gTxt('unknown_attribute', array('{att}' => $name)));
        }
    }

    $pairs['com_connect_globals'] = $com_connect_globals;

    // Prevent global attributes from interfering.
    // See https://github.com/textpattern/textpattern/pull/893
    lAtts(deNull($pairs), $atts, false);

    return ($pairs) ? $pairs : false;
}

/**
 * Build a sanitized, unique attribute array from the given pairs.
 *
 * If called multiple times, earlier values supersede later values
 * if the keys clash.
 *
 * @param  array $pairs    Attribute tuples to compile
 * @param  array $defaults Attribute values to use if the $pairs tuple value is empty
 * @return array
 */
function com_connect_build_atts($pairs, $defaults = array())
{
    $attr = array();

    $booleans = array(
        'autofocus',
        'checked',
        'disabled',
        'hidden',
        'multiple',
        'readonly',
        'required',
        'selected',
        );

    foreach ($pairs as $key => $value) {
        if ($value !== '' && $value !== null) {
            $attr[$key] = $key . (in_array($key, $booleans) ? '' : '="' . txpspecialchars($value) . '"');
        } else {
            if (isset($defaults[$key])) {
                $attr[$key] = $key . (in_array($key, $booleans) ? '' : '="' . txpspecialchars($defaults[$key]) . '"');
            }
        }
    }

    return $attr;
}

/**
 * Replace nulls and newlines in content with spaces.
 *
 * @param string $str    String to sanitize
 * @param bool   $header Whether the string is a header or not
 */
function com_connect_strip($str, $header = true)
{
    if ($header) {
        $str = Txp::get('\Textpattern\Mail\Encode')->escapeHeader($str);
    }

    return preg_replace('/[\x00]/', ' ', $str);
}

/**
 * Returns a file size limit in bytes.
 */
function com_connect_file_max()
{
    // Start with post_max_size.
    $max_size = com_connect_parse_size(ini_get('post_max_size'));

    $upload_max = com_connect_parse_size(ini_get('upload_max_filesize'));

    // If upload_max_filesize is less, then reduce. Except if
    // zero, which indicates no limit.
    if ($upload_max > 0 && $upload_max < $max_size) {
        $max_size = $upload_max;
    }

    // If Textpattern's file_max_upload_size is less, then reduce. Except if
    // zero, which indicates no limit.
    $upload_max = get_pref('file_max_upload_size');

    if ($upload_max > 0 && $upload_max < $max_size) {
        $max_size = $upload_max;
    }

    return $max_size;
}

/**
 * Convert a size value with suffix (K, M, G, T, etc) to bytes.
 *
 * @param  string $size The string that contains a size and multipler units
 * @return int          The size converted to bytes
 * @example
 * com_connect_parse_size('2M');
 * // Returns: 2048000
 */
function com_connect_parse_size($size)
{
    $multipliers = 'bkmgtpezy';

    $unit = preg_replace('/[^'.$multipliers.']/i', '', $size); // Remove the non-unit characters from the size.
    $size = preg_replace('/[^0-9\.\,]/', '', $size); // Remove the non-numeric characters from the size.

   if ($unit) {
        // Find the position of the unit in the ordered string which is
        // the power of magnitude to multiply a kilobyte by.
        return round($size * pow(1024, stripos($multipliers, $unit[0])));
    } else {
        return round($size);
    }
}

/**
 * Convert the $_FILES array into a standard form, regardless how many are presented
 *
 * @param  array $files_entry The item from the $_FILES superglobal
 * @return array
 */
function com_connect_standardize_files($files_entry)
{
    $isMulti = is_array($files_entry['name']);
    $file_count = $isMulti ? count($files_entry['name']) : 1;
    $file_keys = array_keys($files_entry);

    $out = array();

    for ($idx = 0; $idx < $file_count; $idx++) {
        foreach($file_keys as $key) {
            if($isMulti) {
                $out[$idx][$key] = $files_entry[$key][$idx];
            } else {
                $out[$idx][$key] = $files_entry[$key];
            }
        }
    }

    return $out;
}

/**
 * Find entries in an array that match the given pattern
 *
 * @param  string $pattern A regex pattern to match the array keys against
 * @param  array  $input   The array to search
 * @param  int    $flags   Flags to control how the matches are performed
 * @return array
 */
function com_connect_match_keys($pattern, $input, $flags = 0) {
    return array_filter($input, function($key) use ($pattern, $flags) {
           return preg_match($pattern, $key, $flags);
    }, ARRAY_FILTER_USE_KEY);
}

/**
 * Handle content delivery of payload.
 *
 * Triggers a 'comconnect.deliver' callback event to override or augment the
 * delivery mechanism. Third party plugins can make alterations to the $payload,
 * then return one of the strings:
 *  -> "comconnect.send" (or no return value) to allow the plugin to continue mailing after the 3rd party plugin completes
 *  -> "comconnect.skip" to skip com_connect's mailing (i.e. the 3rd party handles mailing) and return 'success'
 *  -> "comconnect.fail" to skip com_connect's mailing and return 'fail'
 *
 * By hooking into the callback's step you can target either the main 'send'
 * process or the 'copysender' process. Examples of things you could do:
 * -> Add Multi-part MIME headers for HTML emails.
 * -> Add CC: or BCC: fields.
 * -> Subscribe people to mailing lists.
 * -> Handle the mailing process independently of Textpattern.
 *
 * @param string $from    Sender address
 * @param string $to      Delivery address
 * @param string $reply   Reply-to address
 * @param string $subject Subject of message
 * @param array  $body    Message content as an array of plain and html components
 * @param array  $fields  Message field names and content as tuples
 * @param array  $flags   Signals to govern delivery / callback behaviour
 */
function com_connect_deliver($from, $to, $reply, $subject, $body, $fields, $flags)
{
    global $com_connect_error, $com_connect_headers;

    $payload = array(
        'from'    => $from,
        'to'      => $to,
        'reply'   => $reply,
        'subject' => $subject,
        'body'    => $body,
        'fields'  => $fields,
        'flags'   => $flags,
        'headers' => $com_connect_headers,
    );

    $flavour = ($flags['isCopy'] === true) ? 'copysender' : 'send';

    // Allow plugins to override or alter default action (mail) if required.
    $ret = callback_event_ref('comconnect.deliver', $flavour, 0, $payload);

    if (in_array('comconnect.fail', $ret)) {
        return false;
    } elseif (in_array('comconnect.skip', $ret)) {
        return true;
    }

    extract($payload);

    try {
        $message = Txp::get('\Textpattern\Mail\Compose')->getDefaultAdapter();

        if (is_array($headers)) {
            foreach ($headers as $hkey => $hval) {
                $message->header($hkey, $hval);
            }
        }

        $message->from($from)
            ->to($to)
            ->subject($subject)
            ->body($body);

        if ($reply) {
            $message->replyTo($reply);
        }

        $attachments = com_connect_match_keys('/^com_connect_file_/', $fields);

        if ($attachments) {
            foreach ($attachments as $key => $fileInfo) {
                $message->attach($fileInfo);
            }
        }

        $ret = $message->send();

        // Tidy up attachments.
        if ($attachments) {
            foreach ($attachments as $fileInfo) {
                unlink($fileInfo['filepath']);
            }
        }

        return $ret;
    } catch (\Textpattern\Mail\Exception $e) {
        $com_connect_error[] = $e->getMessage();
        return false;
    } catch (\PHPMailer\PHPMailer\Exception $e) {
        $com_connect_error[] = $e->errorMessage();
        return false;
    } catch (\Exception $e) {
        $com_connect_error[] = $e->getMessage();
        return false;
    }

    return true;
}

/**
 * Checks if a value or values are in the haystack.
 *
 * @param  string|array $needles  Scalar or array of values to check
 * @param  array        $haystack Set of things to compare them against
 * @return bool
 */
function com_connect_in_array($needles, $haystack)
{
    if (is_array($needles)) {
        return (count(array_intersect($needles, $haystack)) === count($needles));
    } else {
        return in_array($needles, $haystack);
    }
}

/**
 * Checks if any of the values are in the haystack.
 *
 * @param  array  $arrayOfNeedles  Set of values to check
 * @param  string $haystack Thing to compare them against
 * @return bool
 */
function com_connect_strposa($arrayOfNeedles, $haystack)
{
    if (count(array_filter($arrayOfNeedles, function($needle) use ($haystack) {
        return strpos($haystack, $needle) !== false;
    })) > 0) {
        return true;
    } else {
        return false;
    }
}

/**
 * Evaluate return values from plugins.
 */
class comconnect_evaluation
{
    private $status;
    private $reason = array();

    /**
     * Constructor.
     */
    function __construct()
    {
        $this->status = 0;
    }

    /**
     * Append the given status to the counter.
     */
    function add_comconnect_status($check)
    {
        $this->status += $check;
    }

    /**
     * Append the given reason to the array.
     */
    function add_comconnect_reason($reason)
    {
        $this->reason[] = $reason;
    }

    /**
     * Fetch the current evaluator status.
     */
    function get_comconnect_status()
    {
        return $this->status;
    }

    /**
     * Fetch the current evaluator reason.
     */
    function get_comconnect_reason()
    {
        if (empty($this->reason)) {
            $this->reason[] = gTxt('com_connect_spam');
        }

        return join(br, $this->reason);
    }
}

/**
 * Evaluator singleton for checking return values from plugins.
 */
function &get_comconnect_evaluator()
{
    static $instance;

    if (!isset($instance)) {
        $instance = new comconnect_evaluation();
    }

    return $instance;
}

/**
 * Convert the given label to a suitably unique name.
 *
 * @param string $label Label to convert to name.
 */
function com_connect_label2name($label)
{
    $label = trim($label);

    if (strlen($label) == 0) {
        return 'invalid';
    }

    if (strlen($label) <= 32 && preg_match('/^[a-zA-Z][A-Za-z0-9:_-]*$/', $label)) {
        return $label;
    } else {
        return 'q' . md5($label);
    }
}

/**
 * Store the given names/values in the global arrays.
 *
 * @param  string $name   Parameter name
 * @param  string $label  Parameter label
 * @param  string $value  Parameter value
 * @param  string $expect Expected parameter value for comparison
 */
function com_connect_store($name, $label, $value, $expect = null)
{
    global $com_connect_form, $com_connect_labels, $com_connect_values, $com_connect_expect;

    $label = (empty($label)) ? $name : $label;
    $com_connect_form[$label] = $value;
    $com_connect_labels[$name] = $label;
    $com_connect_values[$name] = $value;

    if ($expect !== null) {
        $com_connect_expect[$name] = $expect;
    }
}

/**
 * Store the given name/value header pairs in the global array.
 *
 * @param  string $name   Header name
 * @param  string $value  Header value
 */
function com_connect_store_header($name, $value)
{
    global $com_connect_headers;

    $com_connect_headers[$name] = $value;
}

/**
 * Override the language strings if necessary.
 *
 * @param  string $lang Language designator (e.g. fr-fr)
 * @return array        Partial language array to merge with current loaded strings
 */
function com_connect_load_lang($lang = LANG)
{
    $out = array();

    if ($lang != LANG) {
        $rs = safe_rows("name, data", 'txp_lang', "lang = '" . doSlash($lang) . "' AND name like 'com\_connect\_%'");

        if (!empty($rs)) {
            foreach ($rs as $a) {
                $out[$a['name']] = $a['data'];
            }
        }
    }

    return $out;
}

/**
 * Return the value of the given attribute, by name or its label.
 *
 * @param  array $atts Attribute to return
 * @return string
 */
function com_connect_value($atts)
{
    global $com_connect_values, $com_connect_form, $com_connect_item;

    extract(lAtts(array(
        'break'   => ', ',
        'class'   => '',
        'label'   => '',
        'name'    => '',
        'wraptag' => '',
    ), $atts));

    $str = '';

    if (empty($name) && !empty($com_connect_item)) {
        $name = $com_connect_item;
    }

    if ($name) {
        $str = isset($com_connect_values[$name]) ? $com_connect_values[$name] : '';
    } elseif ($label) {
        $str = isset($com_connect_form[$label]) ? $com_connect_form[$label] : '';
    }

    $str = doArray($str, 'trim');

    return doWrap($str, $wraptag, $break, $class);
}

/**
 * Return the label for the given attribute.
 *
 * @param  array $atts Attribute name to return
 * @return string
 */
function com_connect_label($atts)
{
    global $com_connect_labels, $com_connect_item;

    extract(lAtts(array(
        'name' => '',
    ), $atts));

    if (empty($name) && !empty($com_connect_item)) {
        $name = $com_connect_item;
    }

    if ($name) {
        return isset($com_connect_labels[$name]) ? $com_connect_labels[$name] : '';
    }

    return '';
}

/**
 * Conditional tag for checking variable conditions.
 *
 * @param  array  $atts  Attributes to check
 * @param  string $thing Tag's container content
 * @return string
 */
function com_connect_if($atts, $thing = '')
{
    global $com_connect_item;

    extract(lAtts(array(
        'label' => '',
        'name'  => '',
        'value' => null,
    ), $atts));

    if (empty($label) && empty($name) && !empty($com_connect_item)) {
        $name = $com_connect_item;
    }

    $val = com_connect_value(array(
        'label' => $label,
        'name'  => $name,
    ));

    if ($val) {
        $cond = ($value === null || $val == $value);
    } else {
        $cond = false;
    }

    return parse($thing, $cond);
}

/**
 * Iterate over the submitted fields.
 *
 * @param  array  $atts  Tag attributes
 * @param  string $thing Container content
 * @return HTML
 */
function com_connect_fields($atts, $thing = '')
{
    global $com_connect_labels, $com_connect_item;

    extract(lAtts(array(
        'break'   => ', ',
        'class'   => '',
        'label'   => '',
        'name'    => '',
        'wraptag' => '',
    ), $atts));

    $out = array();

    $labels = do_list($label);
    $names = do_list($name);

    foreach ($com_connect_labels as $nm => $lbl) {
        if ((empty($label) && empty($name)) || ($label && in_array($lbl, $labels)) || ($name && in_array($nm, $names))) {
            $com_connect_item = $nm;
            $out[] = parse($thing);
        }
    }

    $com_connect_item = null;

    return doWrap($out, $wraptag, $break, $class);
}

/**
 * Tell the form to expect the given response in the $name field.
 *
 * @param  array $atts Tag atributes
 */
function com_connect_expect($atts)
{
    global $com_connect_expect;

    extract(lAtts(array(
        'name'  => '',
        'value' => null,
    ), $atts));

    if ($name) {
        $com_connect_expect[$name] = $value;
    }

    return '';
}

/**
 * Evaluator for checking expected values against those submitted.
 *
 * Primarily used for built-in spam prevention.
 *
 * @param string $evt Textpattern event
 * @param string $stp Textpattern step
 * @return bool
 */
function com_connect_verify($evt, $stp)
{
    global $com_connect_expect, $com_connect_values;

    if (is_array($com_connect_expect)) {
        $evaluation = &get_comconnect_evaluator();

        foreach ($com_connect_expect as $name => $expected) {
            $values = do_list($expected);

            if ((!empty($com_connect_values[$name]) && $expected === null) ||
                (empty($com_connect_values[$name]) && $expected !== null) ||
                (!empty($com_connect_values[$name]) && !in_array($com_connect_values[$name], $values))) {
                $evaluation->add_comconnect_status(1);
            }
        }
    }

    return;
}
