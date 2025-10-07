<txp:output_form form="section_search" />
<txp:if_logged_in group="publisher" not><txp:pat_speeder gzip="0"/></txp:if_logged_in>

<!doctype html>
<html lang="en-gb">

<head>
<meta charset="utf-8">

<title><txp:site_name />: <txp:error_status /></title>

<meta name="author" content="NeMe">
<meta name="Robots" content="noindex,nocache,follow">
<meta name="GOOGLEBOT" content="NOARCHIVE"><link rel="home" href="<txp:site_url />">

<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta name="format-detection" content="telephone=no">

<link rel="icon" href="<txp:site_url />favicon.ico" type="image/x-icon">
<link rel="icon" href="<txp:site_url />favicon.svg" type="image/svg+xml">
<link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="/apple-touch-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="/apple-touch-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon-180x180.png">
<link rel="icon" type="image/png" href="/favicon-32x32.png" sizes="32x32">
<link rel="icon" type="image/png" href="/favicon-194x194.png" sizes="194x194">
<link rel="icon" type="image/png" href="/android-chrome-192x192.png" sizes="192x192">
<link rel="icon" type="image/png" href="/favicon-16x16.png" sizes="16x16">
<link rel="manifest" href="/manifest.json">
<txp:hide><link rel="mask-icon" href="/safari-pinned-tab.svg" color="#ba0000" /></txp:hide>
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="/mstile-144x144.png">
<meta name="theme-color" content="#ffffff">

<link rel="alternate" type="application/atom+xml" title="Atom feed" href="<txp:site_url />atom/">
<link rel="alternate" type="application/rss+xml" title="RSS feed" href="<txp:site_url />rss/">

<txp:css name="default" format="flat.link" media="all" />

<!--[if IE]>
<txp:css name="ie-fluid" format="flat.link" />
<![endif]-->

<txp:css name="print" format="flat.link" media="print" />

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


<img src="<txp:page_url type="theme_path" />/forms/svg/neme_peace.svg" alt="NeMe logo" class="logo" width="50" height="50">

<txp:output_form form="colak_menu" />

<div id="content">
<div class="container_24">
<h1><txp:site_name />: <txp:error_status /></h1>
<h2 class="error-msg"><txp:if_status status="404">The page<br><strong><txp:site_url trim="/" /><txp:page_url /></strong><br>does not exist. Check that the url is typed correctly.<txp:else /><txp:error_message /></txp:if_status></h2>

<div class="announce"><p>Note that since the redesign and partial restructuring of our site, many urls might return a 404 error. Except from the <a rel="bookmark" href="/texts/">texts</a> all our previously published international arts information and calls have been relocated to our <a href="<txp:site_url />blog/">blog</a> section which is now hosting our continually updated legacy content. We also relocated our content previously fund under the <em>Events, Participations, NAC, and Workshops</em> pages to <a rel="follow" href="/projects/">Projects</a>, <a rel="follow" href="/projects/hosted/">Hosted</a>, and <a rel="follow" href="/about/">About</a>. We apologise for any inconviniace, our upgrade may have caused.</p></div>
<txp:output_form form="announce" />

</div><!-- end .container_24 -->
</div>

<txp:output_form form="colak_foot" />
<txp:output_form form="javascripts" />

</body>
</html>
