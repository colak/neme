<txp:output_form form="section_search" />
<txp:if_logged_in group="publisher" not><txp:pat_speeder gzip="0"/></txp:if_logged_in>

<!doctype html>

<html lang="en-gb">
<head>
<title><txp:page_title /></title>
<meta charset="utf-8">
<meta name="generator" content="Textpattern CMS">
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone=no">
<txp:act_if_mobile><meta http-equiv="x-rim-auto-match" content="none"></txp:act_if_mobile>
<meta name="mobile-web-app-capable" content="yes">


<link rel="stylesheet" media="all" href="<txp:css name="default" format="flat.url" />">
<txp:if_article_list><link rel="stylesheet" media="all" href="<txp:css name="articlelists" format="flat.url" />"></txp:if_article_list>
<!--[if IE]><link rel="stylesheet" media="all" href="<txp:css name="ie-fluid" format="flat.url" />"><![endif]-->
<!--[if IE 7]><link rel="stylesheet" media="all" href="<txp:css name="ie7" format="flat.url" />"><![endif]-->
<!--[if gte IE 9]<style type="text/css">nav li {filter: none;}</style><![endif]-->
<txp:act_if_mobile><link rel="stylesheet" media="screen" href="<txp:css name="mobile" format="flat.url" />"></txp:act_if_mobile>
<link rel="stylesheet" media="print" href="<txp:css name="print" format="flat.url" />">

<meta name="author" content="NeMe or other publishers">
<meta name="Robots" content="index,follow">
<meta name="revisit-after" content="10 days">
<meta name="geo.region" content="CY">
<meta name="geo.placename" content="Limassol">
<meta name="DC.title" content="<txp:page_title />">

<link rel="home" href="<txp:site_url />">
<txp:if_search>
<link rel="canonical" href="<txp:site_url trim="/" /><txp:page_url escape="" />">
<txp:else />
<txp:if_article_list>
<link rel="canonical" href="<txp:site_url trim="/" /><txp:page_url />">
<txp:else />
<link rel="canonical" href="<txp:permlink />">
</txp:if_section>
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
<meta name="twitter:description" content="<txp:if_description><txp:meta_description format="" /><txp:else /><txp:excerpt escape="textile,tags,html" /></txp:if_description>" />
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

<img src="<txp:page_url type="theme_path" />/forms/svg/neme_peace.svg" alt="NeMe logo" class="logo noprint" width="50" height="50">
<txp:output_form form="colak_menu" />
<div class="clear">&nbsp;</div>
<div id="content"><div class="container_24">

<txp:if_article_list>


<txp:hide>==================-citations-======================</txp:hide>

<txp:if_category name="cited">
<txp:images category="cited" break="" limit="8" sort="rand()">
<aside class="noprint g_3">
<txp:image loading="lazy" style="width:100%; height:auto;" />
</aside>
</txp:images>

<div class="clearboth">&nbsp;</div>

<txp:article_custom status="sticky" id="2373">
<article class="grid_22 prefix_1 suffix_1">
<h1><txp:if_logged_in not><txp:title /><txp:else /><a href="/textpattern/index.php?event=article&step=edit&ID=2373"><txp:title /></a></txp:if_logged_in></h1>
<txp:body />
</article>
</txp:article_custom>

<div class="clear">&nbsp;</div>

<div class="g_12 preg"><h5 class="centre" style="padding:.5rem 0;"><a href="/publications/">Publications</a></h5></div><div class="g_12 preg"><h5 class="centre" style="padding:.5rem 0;"><a href="/publications/mentioned/">Mentions</a></h5></div><div class="clearboth">&nbsp;</div>
<txp:hide><txp::pub_forms /></txp:hide>

<div class="clear">&nbsp;</div>

<txp:else />


<txp:hide>==================-mentions-======================</txp:hide>

<txp:if_category name="mentioned">

<txp:images category="other-publications" limit="8" sort="rand()" break="">
<aside class="noprint g_3"><txp:image loading="lazy" style="width:100%; height:auto;" /></aside>
</txp:images>

<div class="clearboth">&nbsp;</div>

<txp:article_custom status="sticky" id="2375">
<article class="grid_22 prefix_1 suffix_1">
<h1><txp:if_logged_in not><txp:title /><txp:else /><a href="/textpattern/index.php?event=article&step=edit&ID=2375"><txp:title /></a></txp:if_logged_in></h1>
<txp:body />
</article>
</txp:article_custom>

<div class="clear">&nbsp;</div>

<div class="g_12 preg"><h5 class="centre" style="padding:.5rem 0;"><a href="/publications/">Publications</a></h5></div><div class="g_12 preg"><h5 class="centre" style="padding:.5rem 0;"><a href="/publications/cited/">Citations</a></h5></div><div class="clearboth">&nbsp;</div>

<txp:hide><txp::pub_forms /></txp:hide>

<div class="clear">&nbsp;</div>

<txp:else />


<txp:hide>==================-publications-======================</txp:hide>

<txp:if_section name="publications">

<div class="line"><h4 class="grid_23 alpha" id="nemepubs"><txp:if_logged_in not>NeMe publications<txp:else /><a href="/textpattern/index.php?event=page&name=publications">NeMe publications</a></txp:if_logged_in></h4><div class="clear">&nbsp;</div></div>

<txp:variable name="ids"><txp:article_custom section="projects,about" pubs fields="list(thisid)"><txp:article_id /></txp:article_custom></txp:variable>

<txp:article_custom id='<txp:variable name="ids" />' limit="999" sort="posted desc">
<txp:images id='<txp:custom_field name="pubs" />' break="">
<div class="line" id="book_<txp:image_info type="id" />">
<figure itemscope itemtype="http://schema.org/ImageObject"><span itemprop="image" class="grid_6"><txp:if_first_article><txp:permlink>
<txp:image fetchpriority="high" /></txp:permlink></txp:else /><txp:permlink>
<txp:image loading="lazy" /></txp:permlink></txp:if_first_article></span><figcaption itemprop="caption" class="grid_17"><txp:image_info type="caption" escape="" />
<txp:if_logged_in group="publisher"><p class="noprint"><a href="/textpattern/index.php?event=image&amp;step=image_edit&amp;id=<txp:image_info type="id" />">edit</a></p></txp:if_logged_in></figcaption></figure><div class="clear">&nbsp;</div></div>
</txp:images>
</txp:article_custom> 

<div class="line grid_24"><h4 id="contributed">NeMe contributed to the following publications.</h4></div>

<txp:variable name="otherpubs" value='<txp:article_custom section="projects,about" limit="999" break=","><txp:if_custom_field name="pubs_by_others"><txp:custom_field name="pubs_by_others" /></txp:if_custom_field><txp:if_custom_field name="multi_event_pubs"><txp:custom_field name="multi_event_pubs" /></txp:if_custom_field></txp:article_custom>' />

<txp:images id='<txp:variable name="otherpubs" />' category="participated" sort="alt desc" limit="999" break="">
<txp:if_different>
<div class="line" id="book_<txp:image_info type="id" />"><figure itemscope itemtype="http://schema.org/ImageObject"><span itemprop="image" class="grid_6"><a href="<txp:site_url /><txp:image_info type="name" />"><txp:image loading="lazy" loading="lazy" /></a></span>
<figcaption itemprop="caption" class="grid_17"><txp:image_info type="caption" escape="" /><txp:if_logged_in><p><a href="/textpattern/index.php?event=image&amp;step=image_edit&amp;id=<txp:image_info type="id" />">edit</a></p></txp:if_logged_in></figcaption></figure>
<div class="clear">&nbsp;</div>
</div>
</txp:if_different>
</txp:images>

<div class="clear">&nbsp;</div>

<div class="g_12 preg"><h5 class="centre" style="padding:.5rem 0;"><a href="/publications/mentioned/">Mentions</a></h5></div><div class="g_12 preg"><h5 class="centre" style="padding:.5rem 0;"><a href="/publications/cited/">Citations</a></h5></div><div class="clearboth">&nbsp;</div>
<txp:hide><txp::pub_forms /></txp:hide>
</txp:if_section>
</txp:if_category>
<div class="clear">&nbsp;</div>
</txp:if_article_list>

</div><!-- end .container_24 --></div>

<txp:output_form form="colak_foot" />

</body>

</html>
