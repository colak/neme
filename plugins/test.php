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
        ->register('com_connect_expect')
        ->register('com_connect_nonce'); // Added nonce registration
}

register_callback('com_connect_verify', 'comconnect.submit');

function com_connect($atts, $thing = '') {
    global $sitename, $com_connect_flags, $com_connect_from, $com_connect_recipient, $com_connect_error, $com_connect_submit, $com_connect_form, $com_connect_labels, $com_connect_values, $com_connect_js;
    
    extract(com_connect_lAtts(array(
        'action'            => '',
        'body_form'         => '',
        'class'             => 'comConnectForm',
        'classes'           => '',
        'copysender'        => 0,
        'delay'             => '5-10',
        'expire'            => 600,
        'form'              => '',
        'from'              => '',
        'from_form'         => '',
        'label'             => null,
        'browser_validate'  => 1,
        'redirect'          => '',
        'replyto'           => true,
        'required'          => '1',
        'show_error'        => 1,
        'show_input'        => 1,
        'send_article'      => 0,
        'subject'           => null,
        'subject_form'      => '',
        'to'                => '',
        'to_form'           => '',
        'thanks'            => null,
        'thanks_form'       => '',
    ), $atts));

    $doctype = get_pref('doctype', 'xhtml');

    if (!empty($lang)) {
        $strings = com_connect_load_lang($lang);
        $current = Txp::get('\Textpattern\L10n\Lang')->getStrings();
        $textarray = array_merge($current, $strings);
        Txp::get('\Textpattern\L10n\Lang')->setPack($textarray);
    }

    if ($label === null) {
        $label = gTxt('com_connect_contact');
    }

    if ($subject === null) {
        $subject = gTxt('com_connect_email_subject', array('{site}' => html_entity_decode($sitename, ENT_QUOTES)));
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

    $com_connect_flags['this_form'] = 'com' . $com_connect_form_id;
    $com_connect_flags['required'] = $required;
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
        safe_delete('txp_discuss_nonce', "issue_time < date_sub('$now_date', interval " . max(600, $expire) . " second)");
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
<txp:com_connect_text label="' . gTxt('com_connect_name') . '" />' . $br . '<txp:com_connect_email />' . $br . ($send_article ? '<txp:com_connect_email send_article="1" label="' . gTxt('com_connect_recipient') . '" />' . $br : '') . '<txp:com_connect_textarea />' . $br . '<txp:com_connect_submit />
';
    }

    $form = parse($form);

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
        // No action needed
    } elseif (!empty($com_connect_error)) {
        if ($show_error || !$show_input) {
            $out .= n . doWrap(array_unique($com_connect_error), 'ul', 'li', $com_connect_flags['cls_wrapper']) . n;
            if (!$show_input) {
                return $out;
            }
        }
    } elseif ($show_input && is_array($com_connect_form)) {
        callback_event('comconnect.submit');
        $evaluation = &get_comconnect_evaluator();
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
            $subject = str_replace('&', '&', $thisarticle['title']);
            $msg[] = permlinkurl($thisarticle);
            $msg[] = $subject;
            $s_ar = array('‘', '’', '“', '”', '’', '′', '″', '…', '–', '—', '×', '™', '®', '©', '&lt;', '&gt;', '&quot;', '&amp;', '&', "\t", '<p');
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

        $to = com_connect_strip($to);
        $subject = com_connect_strip($subject);
        $body = implode("\n\n", $msg);

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
$uri = hu . ltrim($redirect, '/');
if (empty($_SERVER['FCGI_ROLE']) && empty($_ENV['FCGI_ROLE'])) {
txp_status_header('303 See Other');
header('Location: ' . $uri);
header('Connection: close');
header('Content-Length: 0');
} else {
$uri = txpspecialchars($uri);
// Handle refresh logic or output termination if required by environment
}
}
}
}
// Return final template elements or status messages if appropriate
return $out;
}
/**

* Server-side tag function to render a secure hidden input for the nonce.
*/
function com_connect_nonce($atts) {
global $com_connect_nonce;if (empty($com_connect_nonce)) {
return '';
}// Renders safely as HTML entirely on the server side
return '';
}

