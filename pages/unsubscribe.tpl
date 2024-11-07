<txp:output_form form="section_search" />
<txp:if_logged_in group="publisher" not><txp:pat_speeder gzip="0"/></txp:if_logged_in>

<txp:if_article_list>
<txp:evaluate query='"<txp:site_url trim="/" /><txp:page_url type="req" />" != "<txp:page_url context />"'>
    <txp:txp_die status="404" />
</txp:evaluate>
</txp:if_article_list>

<!doctype html>
<html lang="en-gb">

<head>
<title><txp:page_title /></title>
<meta charset="utf-8">
<txp:hide><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></txp:hide>
<meta name="generator" content="Textpattern CMS">
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone=no">
<txp:act_if_mobile><meta http-equiv="x-rim-auto-match" content="none"></txp:act_if_mobile>
<meta name="apple-mobile-web-app-capable" content="yes">

<link rel="stylesheet" media="all" href="<txp:css name="default" format="flat.url" />">
<txp:if_article_list><link rel="stylesheet" media="all" href="<txp:css name="articlelists" format="flat.url" />"></txp:if_article_list>
<!--[if IE]><link rel="stylesheet" media="all" href="<txp:css name="ie-fluid" format="flat.url" />"><![endif]-->
<!--[if IE 7]><link rel="stylesheet" media="all" href="<txp:css name="ie7" format="flat.url" />"><![endif]-->
<!--[if gte IE 9]<style type="text/css">nav li {filter: none;}</style><![endif]-->
<txp:act_if_mobile><link rel="stylesheet" media="screen" href="<txp:css name="mobile" format="flat.url" />"></txp:act_if_mobile>
<link rel="stylesheet" media="print" href="<txp:css name="print" format="flat.url" />">

<meta name="author" content="NeMe or other publishers">
<meta name="Robots" content="noindex,follow">
<meta name="revisit-after" content="365 days">

<meta name="geo.region" content="CY">
<meta name="geo.placename" content="Limassol">
<meta name="DC.title" content="<txp:page_title />">


<link rel="home" href="<txp:site_url />">
<txp:if_search>
<link rel="canonical" href="<txp:site_url trim="/" /><txp:page_url escape="" />">
<txp:else />
<txp:if_article_list>
<link rel="canonical" href="<txp:site_url /><txp:section />/">
<txp:else />
<link rel="canonical" href="<txp:permlink />">
</txp:if_article_list>
</txp:if_search>

<txp:if_description><txp:meta_description /></txp:if_description>

<meta property="og:site_name" content="<txp:site_name />">
<meta property="og:type" content="website">
<meta property="og:title" content="<txp:page_title />">
<txp:if_description><meta property="og:description" content="<txp:meta_description format="" />"></txp:if_description>
<meta property="og:url" content="<txp:site_url trim="/" /><txp:page_url />">

<txp:if_individual_article>
<meta name="twitter:card" content="summary">
<meta name="twitter:site" content="@nemeorg">
<meta name="twitter:creator" content="@nemeorg">
<meta name="twitter:url" content="<txp:permlink />">
<meta name="twitter:title" content="<txp:page_title />">
<meta name="twitter:description" content="<txp:if_description><txp:meta_description format="" /><txp:else /><txp:excerpt escape="textile,tags,html" /></txp:if_description>">
<txp:if_custom_field name="img_main" value="">
<meta name="twitter:image" content="<txp:images id="3"><txp:image_url /></txp:images>">
<meta property="og:image" content="<txp:site_url />images/1087.jpg">
<meta property="og:image:width" content="1200">
<meta property="og:image:height" content="400">
<meta property="og:image:alt" content="NeMe logo">
<txp:else />
<txp:variable name="imgmain"><txp:images break="" sort="rand()" limit="1" id='<txp:custom_field name="img_main" />'><txp:image_info type="id" /></txp:images></txp:variable>
<meta name="twitter:image" content="<txp:images break="" id='<txp:variable name="imgmain" />'><txp:image_url /></txp:images>">
<meta property="og:image" content="<txp:images break="" id='<txp:variable name="imgmain" />'><txp:image_url /></txp:images>">
<meta property="og:image:width" content="<txp:images break="" id='<txp:variable name="imgmain" />'><txp:image_info type="w" /></txp:images>">
<meta property="og:image:height" content="<txp:images break="" id='<txp:variable name="imgmain" />'><txp:image_info type="h" /></txp:images>">
<meta property="og:image:alt" content="<txp:images break="" id='<txp:variable name="imgmain" />'><txp:image_info type="alt" /></txp:images>">
</txp:if_custom_field>
<txp:else />
<meta property="og:image" content="<txp:site_url />images/1087.jpg">
<meta property="og:image:width" content="1200">
<meta property="og:image:height" content="400">
<meta property="og:image:alt" content="NeMe logo">
<meta name="twitter:card" content="summary">
<meta name="twitter:site" content="@nemeorg">
<meta name="twitter:creator" content="@nemeorg">
<meta name="twitter:url" content="<txp:site_url trim="/" /><txp:page_url />">
<meta name="twitter:title" content="<txp:page_title />">
<meta name="twitter:description" content="<txp:meta_description format="" />">
<meta name="twitter:image" content="<txp:images id="3"><txp:image_url /></txp:images>">
</txp:if_individual_article>


<link rel="alternate" type="application/atom+xml" title="Atom feed" href="<txp:site_url />atom/">
<link rel="alternate" type="application/rss+xml" title="RSS feed" href="<txp:site_url />rss/">
<txp:hide><link rel="alternate" type="application/json" title="JSON feed" href="<txp:site_url />feed.json" /></txp:hide>

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

</head>

<txp:hide>==================-body-======================</txp:hide>

<body id="<txp:section />" class="no-js">

<txp:hide>==================-accessibility-======================</txp:hide>

<div id="accessibility">
<ul>
<li><a href="#menu">go to menu</a></li>
<li><a href="#content">go to content</a></li>
<li><a href="#footer">go to search</a></li>
</ul>
</div>

<txp:hide>==================-menu-======================</txp:hide>

<img src="<txp:page_url type="theme_path" />/forms/svg/neme_peace.svg" alt="NeMe logo" class="logo" width="50" height="50">

<txp:output_form form="colak_menu" />

<txp:hide>==================-social-======================</txp:hide>

<div class="clear">&nbsp;</div>

<div id="content"><div class="container_24">

<txp:hide>==================-unsubscribe-======================</txp:hide>

<div class="line"><h4 class="grid_23 alpha" id="nemepubs">Unsubscribe from our newsletter</h4><div class="clear">&nbsp;</div></div>

<img src="<txp:page_url type="theme_path" />/forms/svg/nospam.svg" alt="no spam" class="nosmall grid_3">

<p class="grid_9">Should you wish to unsubscribe from our newsletter, do tell us your email with which you have subscribed, and fill the relevant checkboxes below.</p><div class="clear">&nbsp;</div>

<txp:com_connect to='<txp:authors name="colak"><txp:author_email /></txp:authors>' from="email@unsubscribe.tld" label="" thanks_form="unsubscribe" subject="NeMe Unsubscribe">
<txp:com_connect_email label="Your email" name="Email" required="1" class="grid_24" /><br><br>
<txp:com_connect_secret label="This article"><txp:page_url /></txp:com_connect_secret>
<txp:com_connect_select label="" name="reason" options="{Select},I no longer want to receive these emails,I never signed up for this mailing list,Oher" required="1" /><br><br>
<txp:com_connect_checkbox label="Confirm!" required="1" />
<txp:com_connect_serverinfo name="REMOTE_ADDR" label="IP number" />
<txp:com_connect_serverinfo name="HTTP_USER_AGENT" label="Browser" />
<txp:com_connect_submit label="Unsubscribe" />
</txp:com_connect>
<div class="clear">&nbsp;</div>

</div><!-- end .container_24 --></div>

<txp:output_form form="colak_foot" />
<txp:hide><txp:output_form form="cookies" /></txp:hide>

</body>
</html>
