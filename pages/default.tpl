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
<txp:act_if_mobile>
<meta http-equiv="x-rim-auto-match" content="none">
<meta name="apple-mobile-web-app-capable" content="yes">
</txp:act_if_mobile>


<link rel="stylesheet" media="all" href="<txp:css name="default" format="flat.url" />">
<txp:if_article_list><link rel="stylesheet" media="all" href="<txp:css name="articlelists" format="flat.url" />"></txp:if_article_list>
<!--[if IE]><link rel="stylesheet" media="all" href="<txp:css name="ie-fluid" format="flat.url" />"><![endif]-->
<!--[if IE 7]><link rel="stylesheet" media="all" href="<txp:css name="ie7" format="flat.url" />"><![endif]-->
<!--[if gte IE 9]<style type="text/css">nav li {filter: none;}</style><![endif]-->
<txp:act_if_mobile><link rel="stylesheet" media="screen" href="<txp:css name="mobile" format="flat.url" />"></txp:act_if_mobile>
<link rel="stylesheet" media="print" href="<txp:css name="print" format="flat.url" />">


<txp:if_section name="contact,newsletter">
<meta name="Robots" content="noindex,follow">
<txp:else />
<meta name="author" content="NeMe and contributors">
<meta name="Robots" content="index,follow">
<meta name="revisit-after" content="10 days">
</txp:if_section>

<meta name="geo.region" content="CY">
<meta name="geo.placename" content="Limassol">
<meta name="DC.title" content="<txp:page_title />">


<link rel="home" href="<txp:site_url />">
<txp:if_search>
<link rel="canonical" href="<txp:site_url trim="/" /><txp:page_url escape="" />">
<txp:else />
<txp:if_article_list>
<txp:if_section name="">
<link rel="canonical" href="<txp:site_url />">
<txp:else />
<link rel="canonical" href="<txp:site_url /><txp:section />/">
</txp:if_section>
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
<txp:hide><link rel="mask-icon" href="/safari-pinned-tab.svg" color="#ba0000"></txp:hide>
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="/mstile-144x144.png">
<meta name="theme-color" content="#ffffff">


<txp:hide>
<!-- support for battleforthenet.com -->
<script type="text/javascript" src="//widget.battleforthenet.com/widget.min.js" async="async"></script>
</txp:hide>

</head>

<txp:hide>==================-body-======================</txp:hide>

<body id="<txp:if_section name="">front<txp:else /><txp:section /></txp:if_section>" class="no-js">

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

<div id="content"><div class="container_24">

<txp:hide>==================-home page-======================</txp:hide>

<txp:if_section name="">
<txp:if_search>
<txp:variable name="searchterm_minchars" value="3" />
<txp:variable name="searchterm_tooshort"><txp:php>global $variable, $q; echo ( strlen(trim($q)) < intval($variable['searchterm_minchars']) ) ? 'yes' : '';
</txp:php></txp:variable>
<txp:article pgonly="1" searchall="0" searchsticky="1" />
<txp:if_search_results max="200">
<h3>You searched for <strong><txp:page_url type="q" /></strong>. <txp:search_result_count />.</h3>
<hr>
<txp:else />
<p>Your search for <strong><txp:page_url type="q" /></strong> did not match any documents.</p>
<h3>Suggestions:</h3>
<ul>
<li>Make sure all words are spelled correctly.</li>
<li>Try fewer keywords</li>
<li>Try different keywords</li>
<li>Use our menu links above. Parts of this site are not included in the search facility</li>
</ul>
</txp:if_search_results>
<txp:if_variable name="searchterm_tooshort" value="yes">
<p>Sorry, your search term <em><txp:search_term /></em> is too short. Please try again with a word with at least <txp:variable name="searchterm_minchars" /> letters.</p>
<txp:else />
<txp:article limit="999" searchall="0" />
</txp:if_variable>

</txp:if_search>
</txp:if_section>

<txp:if_section name="">
<txp:if_search>
<txp:else />
<article class="grid_6 about" role="main">
<txp:article_custom id="2001">
<h1><txp:title /></h1>
<txp:excerpt />
<p class="text-right"><a href="<txp:site_url />about/">read more&#8230;</a></p>
</txp:article_custom>
</article>

<figure itemscope itemtype="http://schema.org/ImageObject" class="grid_18 slides"><txp:images category="promote" limit="8" sort="rand()" wraptag="ul" break="li" class="rslides"><txp:permlink id='<txp:image_info type="name" />'><txp:image /></txp:permlink>
</txp:images></figure>

<div class="clearboth">&nbsp;</div>

<div class="grid_6 frontthumbs noprint">
<txp:output_form form="announce" />
<txp:hide><h3>Blog</h3>
<txp:article_custom section="blog" limit="4" c10="" status="live" break="li" wraptag="ul">
<txp:permlink><txp:title /></txp:permlink>
</txp:article_custom></txp:hide>
</div>

<div class="grid_6 frontthumbs noprint">
<txp:article_custom limit="10" section="projects" label="Activities" labeltag="h3" break="li" wraptag="ul" sort="Posted desc">
<txp:permlink><txp:title /></txp:permlink>
</txp:article_custom>
</div>

<div class="smallbreak">&nbsp;</div>

<div class="grid_6 frontthumbs noprint">
<txp:article_custom section="texts" limit="10" sort="rand()" break="li" wraptag="ul" labeltag="h3" label="Texts">
<txp:permlink><txp:title /></txp:permlink>
</txp:article_custom>
</div>

<div class="grid_6 frontthumbs noprint">
<h3>Blog</h3>
<txp:article_custom section="blog" limit="5" c10="" status="live" break="li" wraptag="ul">
<txp:permlink><txp:title /></txp:permlink>
</txp:article_custom>
<txp:output_form form="social_logos" />
</div>

<div class="clearboth">&nbsp;</div>
</txp:if_search>
</txp:if_section>

<div class="clear">&nbsp;</div>

</div><!-- end .container_24 --></div>

<txp:output_form form="YouTubeChannel" />
<div class="container_24">
<span class="grid_1 prefix_23 nosmall noprint"><a href="#"><img class="margintop" src="<txp:page_url type="theme_path" />/forms/svg/top.svg" width="30" height="30" alt="back to top"></a></span>
<div class="clear">&nbsp;</div>
</div>
<txp:output_form form="colak_foot" />
<txp:hide><txp:output_form form="cookies" /></txp:hide>
<txp:output_form form="javascripts" />

</body>
</html>
