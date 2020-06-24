<txp:php>
	if ($_POST['submit']) {
		$url = $_POST['site'].$_POST['terms'];
		if ($_POST['section'] && ($_POST['section'] != 'null')) $url = $url.'&s='.$_POST['section'];
		header('Location: '.$url);
	} else {
		header('content-type: text/html; charset=utf-8');
	}
</txp:php>


<txp:if_logged_in group="publisher" not><txp:pat_speeder gzip="0"/></txp:if_logged_in>

<!doctype html>
<html lang="en-gb">

<head>
<meta charset="utf-8" />

<title><txp:site_name />: <txp:error_status /></title>
<meta name="Robots" content="noindex,follow" />
<link rel="home" href="<txp:site_url />" />

<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1" />

<meta name="format-detection" content="telephone=no" />

<txp:feed_link flavor="atom" format="link" label="Atom" />
<txp:feed_link flavor="rss" format="link" label="RSS" />

<txp:css name="default" format="flat.link" media="all" />

<!--[if IE]>
<txp:css name="ie-fluid" format="flat.link" />
<![endif]-->

<txp:css name="print" format="flat.link" media="print" />

<!--[if (IE 6)|(IE 7)|(IE 8)]>
<script src="<txp:output_form form="jquery1x.js" context="flat.url" />"></script>
<![endif]-->
<!--[if gte IE 9]>
<script src="<txp:output_form form="jquery2xx.js" context="flat.url" />"></script>
<![endif]-->
<!--[if !IE]>-->
<script src="<txp:output_form form="jquery2xx.js" context="flat.url" />"></script>
<!--<![endif]-->


<script>
$(document).ready(function() {
$('body').removeClass('no-js').addClass('js');
});
</script>

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


</head>
<body id="error">


<img src="<txp:page_url type="theme_path" />/forms/svg/neme_white.svg" alt="NeMe logo" class="logo" width="50" height="50" />

<txp:output_form form="colak_menu" />

<div id="header">
<div class="container_24">

<div class="grid_24">
<h1><txp:site_name />: <txp:error_status /></h1>
</div>
</div>
<div class="clear">&nbsp;</div>
</div>

<div id="content">
<div class="container_24">

<h2 class="error-msg"><txp:if_status status="404">The page<br /><strong><txp:site_url trim="/" /><txp:page_url /></strong><br />does not exist. Check that the url is typed correctly.<txp:else /><txp:error_message /></txp:if_status></h2>

<div class="announce"><p>Note that since the redesign and partial restructuring of our site, many urls might return a 404 error. Except from the <a rel="bookmark" href="/texts/">texts</a> all our previously published international arts information and calls have been relocated to our <a href="<txp:site_url />blog/">blog</a> section which is now hosting our continually updated legacy content. We also relocated our content previously fund under the <em>Events, Participations, NAC, and Workshops</em> pages to <a rel="follow" href="/projects/">Projects</a>, <a rel="follow" href="/projects/hosted/">Hosted</a>, and <a rel="follow" href="/about/">About</a>. We apologise for any inconviniace, our upgrade may have caused.</p></div>

</div><!-- end .container_24 -->
</div>

<txp:output_form form="colak_foot" />
<txp:output_form form="cookies" />
<txp:output_form form="javascripts" />

</body>
</html>
