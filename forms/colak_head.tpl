<txp:php>
	if ($_POST['submit']) {
		$url = $_POST['site'].$_POST['terms'];
		if ($_POST['section'] && ($_POST['section'] != 'null')) $url = $url.'&s='.$_POST['section'];
		header('Location: '.$url);
	} else {
		header('content-type: text/html; charset=utf-8');
	}
</txp:php>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" dir="ltr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="generator" content="Textpattern"/>
<meta name="format-detection" content="telephone=no" />
<txp:if_section name="contact,newsletter">
<meta name="Robots" content="noindex,follow" />
<txp:else />
<meta name="author" content="NeMe and contributors" />
<meta name="Robots" content="index,follow" />
<meta name="revisit-after" content="15 days" />
</txp:if_section>
<meta name="author" content="NeMe" />
<meta name="geo.region" content="CY" />
<meta name="geo.placename" content="Limassol" />
<meta name="DC.title" content="NeMe" />

<txp:if_section name=""><title><txp:site_slogan /></title><txp:else /><title><txp:page_title /></title></txp:if_section>

<link rel="home" href="<txp:site_url />" />

<txp:if_description><txp:meta_description /></txp:if_description>


<txp:feed_link flavor="atom" format="link" label="Atom" />
<txp:feed_link flavor="rss" format="link" label="RSS" />

<link rel="shortcut icon" href="http://www.neme.org/favicon.ico" />
<link rel="icon" href="http://www.neme.org/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="http://www.neme.org/favicon.ico" type="image/x-icon" />


<script src="<txp:output_form form="jquery" context="flat.url" />"></script>

<script>
$(function() {
var pull = $('#pull1');
menu = $('nav ul');
menuHeight = menu.height();

$(pull).on('click', function(e) {
e.preventDefault();
menu.slideToggle();
});

$(window).resize(function(){
var w = $(window).width();
if(w > 320 && menu.is(':hidden')) {
menu.removeAttr('style');
}
});
});
</script>

<txp:css name="default" media="all" format="flat.link" />
<!--[if IE]>
<txp:css name="ie" media="all" format="flat.link" />
<![endif]-->
<txp:css name="print" media="print" format="flat.link" />


</head>

<body id="<txp:if_section name="">front<txp:else /><txp:section /></txp:if_section>">
