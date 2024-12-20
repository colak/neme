<txp:output_form form="section_search" />
<txp:if_logged_in group="publisher" not><txp:pat_speeder gzip="0"/></txp:if_logged_in>

<txp:hide><txp:if_article_list>
<txp:evaluate query='"<txp:site_url trim="/" /><txp:page_url type="req" />" != "<txp:page_url context />"'>
    <txp:txp_die status="404" />
</txp:evaluate>
</txp:if_article_list></txp:hide>

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

<txp:if_individual_article>
<meta name="author" content="NeMe and/or <txp:linklist id='<txp:custom_field name="venue" escape="" />' break="" wraptag=""><txp:link_name /></txp:linklist>">
<txp:else />
<meta name="author" content="NeMe and/or respective authors">
</txp:if_individual_article>


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

<link rel="canonical" href="<txp:page_url context />">
<txp:else />
<txp:evaluate query='contains("<txp:permlink />","?accept_")'>
<txp:else />
<link rel="canonical" href="<txp:permlink />">
</txp:evaluate>
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

<txp:hide>==================-social-======================</txp:hide>

<txp:act_if_mobile not>
<aside class="share large nosmall noprint">
<a href="http://www.facebook.com/sharer/sharer.php?u=<txp:permlink />&amp;t=<txp:site_url trim="/" /><txp:page_url />" rel="nofollow" title="Share on Facebook"><img src="<txp:page_url type="theme_path" />/forms/svg/sm_facebook.svg" width="30" height="30" alt="share on facebook" loading="lazy"></a>
<a href="https://twitter.com/intent/tweet?url=<txp:site_url trim="/" /><txp:page_url />" rel="nofollow" title="Share on Twitter"><img src="<txp:page_url type="theme_path" />/forms/svg/sm_twitter.svg" width="30" height="30" alt="share on twitter" loading="lazy"></a>
<a href="http://www.reddit.com/submit?url=<txp:site_url trim="/" /><txp:page_url />" rel="nofollow" title="Share on Reddit"><img src="<txp:page_url type="theme_path" />/forms/svg/sm_redit.svg" width="30" height="30" alt="share on Redit" loading="lazy"></a>
</aside>
</txp:act_if_mobile>

<txp:hide>==================-article-lists-======================</txp:hide>

<div id="content"><div class="container_24">
<txp:if_article_list>


<txp:hide>==================-texts-======================</txp:hide>

<txp:if_search>
<txp:article pgonly="1" searchall="1" searchsticky="0" />
<txp:if_search_results max="200">
<h3>You searched for <strong><txp:page_url type="q" /></strong>. <txp:search_result_count />.</h3>
<hr>
<txp:else />
<p>Your search for <strong><txp:page_url type="q" /></strong> did not match any documents.</p>
<h3>Suggestions:</h3>
<ul><li>Make sure all words are spelled correctly.</li>
<li>Try fewer keywords</li>
<li>Try different keywords</li></ul>
</txp:if_search_results>
<txp:article limit="999" searchall="0" />
<txp:else />
<div class="">

<article class="grid_6 about" role="main">
<h1>Texts</h1>
<p>This page lists all <txp:article_custom section="texts" pageby="1" pgonly /> texts collected for our online visitors since the launch of our site in 2005. Our published texts are <a href="/publications/cited/">cited</a> in a number of publications, sites, and are used in the reading lists of many university courses. If you have a text which is relevant to this database please do <a href="<txp:site_url />blog/submit-a-text" rel="nofollow">submit it</a> to us. We read all submissions.</p>
</article>

<figure itemscope itemtype="http://schema.org/ImageObject" class="grid_18 slides">
<txp:images category="promote" limit="6" sort="rand()" wraptag="ul" break="li" class="rslides">
<txp:permlink id='<txp:image_info type="name" />'><txp:image loading="lazy" /></txp:permlink>
</txp:images>
</figure>

<div class="clear">&nbsp;</div>
</div>

<main>
<article class="titles">
<div class="grid_6 nosmall"><h6>Author</h6></div>
<div class="grid_18 nosmall"><h6>Title</h6></div>
<div class="clear nosmall">&nbsp;</div>
</article>

<txp:article limit="999">
<article><div class="grid_6"><txp:if_logged_in group="publisher"><a class="noprint" href="<txp:site_url />textpattern/index.php?event=article&amp;step=edit&amp;ID=<txp:article_id />"><txp:linklist id='<txp:custom_field name="venue" escape="" />' wraptag="p" break=" &amp; "><txp:link_name /></txp:linklist></a><txp:else /><txp:linklist id='<txp:custom_field name="venue" escape="" />' wraptag="p" break=" &amp; "><txp:link_name /></txp:linklist></txp:if_logged_in></div>
<div class="grid_18"><h6><a href="<txp:permlink />" rel="bookmark"><txp:title /></a></h6></div>
<div class="clear noprint">&nbsp;</div></article>
</txp:article>
</main>
<div class="line"><h5 class="grid_23 alpha" id="cited"><a href="/publications/cited/">Publications citing our content</a></h5><div class="clear">&nbsp;</div></div>
</txp:if_search>
</txp:if_article_list>


<txp:hide>==================-individual articles-======================</txp:hide>

<txp:if_individual_article>


<txp:hide>==================-individual texts-======================</txp:hide>


<txp:article form="" listform="">

<article class="grid_18" role="main" itemscope itemtype="http://schema.org/Text">

<txp:if_request type="get" name="_neme_redirected">
<div class="grid_24 alpha omega"><strong class="announce">Please note that you have arrived here via an outdated URL. Please update your bookmark. The new URL for this article is: <a href="<txp:permlink />" rel="canonical"><txp:permlink /></a>.</strong></div><div class="clear">&nbsp;</div>
</txp:if_request>

<h1><txp:title /></h1>

<p class="printonly"><txp:site_url trim="/" /><txp:page_url /></p>

<txp:body />

</article>
</txp:article>
<div class="grid_6" id="side" role="complementary">
<div itemscope itemtype="http://schema.org/Person" id="meta">
<p class="linklist">Text by <txp:linklist id='<txp:custom_field name="venue" escape="" />' break=" &amp; " wraptag="">
<txp:variable name="linkurl" value='<txp:link_url />' />
<txp:if_variable name="linkurl" value="#">
<span itemprop="author"><txp:link_name /></span>
<txp:else />
<a rel="author external" href="<txp:link_url />"><txp:link_name /></a>
</txp:if_variable>
</txp:linklist></p>
<txp:if_logged_in><p><a class="noprint" href="<txp:site_url />textpattern/index.php?event=article&amp;step=edit&amp;ID=<txp:article_id />"><txp:article_id /></a></p></txp:if_logged_in>
<time class="published" datetime="<txp:posted format="%Y-%m-%d" />">
Posted: <txp:posted format="%b %d, %Y" /></time>
</div>

<txp:output_form form="announce" />

<txp:output_form form="social_logos" />

<div class="sub">
<txp:etc_query name="find" data='<txp:custom_field name="venue" />' markup="list" break=" OR " >FIND_IN_SET({?}, custom_3)</txp:etc_query>
<txp:if_variable name="find">
<txp:etc_query name="relatedtitles" data='(<txp:variable name="find" />) AND ID != <txp:article_id />' markup="db" populate="article"  wraptag="ul" class="related_articles" label="By the same author" labeltag="h3">
<txp:variable name="relatedtexts" value='<txp:variable name="relatedtexts" />,<txp:article_id />' />
{$<({#row}|21).?(<li><a href="<txp:permlink />"><txp:title /></a></li>)}
<txp:else />
</txp:etc_query>
</txp:if_variable>
<txp:variable name="relatedtitles" />
<txp:article_custom sort="rand()" section="texts" exclude='<txp:article_id />,<txp:variable name="relatedtexts" />' limit='<txp:if_variable name="relatedtexts">15<txp:else />20</txp:if_variable>' break="li" wraptag="ul" class="submenu" label="Other Texts" labeltag="h3">
<a href="<txp:permlink />"><txp:title /></a>
</txp:article_custom>
</div>

<txp:if_custom_field name="pubs_by_others">
<txp:images id='<txp:custom_field name="pubs_by_others" />'>
<div class="nosmall">
<h4>Off line reading</h4>
<a class="nostyle" rel="external" href="<txp:image_info type="caption" />"><img itemscope itemtype="http://schema.org/ImageObject" loading="lazy" src="/images/<txp:custom_field name="pubs_by_others" /><txp:image_info type="ext" />" width="<txp:image_info type="w" />" height="<txp:image_info type="h" />" alt="<txp:image_info type="alt" default="Image at NeMe" />" class="<txp:yield name="class" default="grid_24" />"></a>
</txp:images>
</div>
</txp:if_custom_field>

</div>
</txp:article>
</txp:if_individual_article>

<txp:hide>==================-end individual articles-======================</txp:hide>

<div class="clear">&nbsp;</div>
<span class="grid_1 prefix_23 alpha omega nosmall noprint"><a href="#"><img class="margintop" src="<txp:page_url type="theme_path" />/forms/svg/top.svg" width="30" height="30" alt="back to top"></a></span>

<div class="clear">&nbsp;</div>

</div><!-- end .container_24 --></div>

<txp:output_form form="colak_foot" />
<txp:hide><txp:output_form form="cookies" /></txp:hide>
<txp:if_article_list><txp:output_form form="javascripts" /></txp:if_article_list>

</body>
</html>
