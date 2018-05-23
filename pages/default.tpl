<txp:php>
if (isset($_POST['submit'])) {
$url = $_POST['site'].$_POST['terms'];
if ($_POST['section'] && ($_POST['section'] != 'null')) $url = $url.'&s='.$_POST['section'];
header('Location: '.$url);
} else {
header('content-type: text/html; charset=utf-8');
}
</txp:php>

<!doctype html>

<!--[if lt IE 7]> <html lang="en-gb" class="ie ie6 lte9 lte8 lte7"> <![endif]-->
<!--[if IE 7]> <html lang="en-gb" class="ie ie7 lte9 lte8 lte7"> <![endif]-->
<!--[if IE 8]> <html lang="en-gb" class="ie ie8 lte9 lte8"> <![endif]-->
<!--[if IE 9]> <html lang="en-gb" class="ie ie9 lte9"> <![endif]-->
<!--[if gt IE 9]> <html lang="en-gb" class="ie10"> <![endif]-->
<!--[if !IE]><!--> <html lang="en-gb"> <!--<![endif]-->

<head>
<title><txp:page_title /></title>

<meta charset="utf-8">
<txp:hide><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></txp:hide>
<meta name="generator" content="Textpattern CMS"/>
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="format-detection" content="telephone=no" />
<txp:act_if_mobile><meta http-equiv="x-rim-auto-match" content="none" />
</txp:act_if_mobile>
<meta name="apple-mobile-web-app-capable" content="yes">

<txp:rvm_css name="default" format="link" media="all" />
<txp:if_article_list><txp:rvm_css name="articlelists" format="link" media="all" /></txp:if_article_list>
<!--[if IE]><txp:rvm_css name="ie-fluid" format="link" /><![endif]-->
<!--[if IE 7]><txp:rvm_css name="ie7" format="link" /><![endif]-->
<!--[if gte IE 9]<style type="text/css">nav li {filter: none;}</style><![endif]-->
<txp:rvm_css name="print" format="link" media="print" />


<txp:if_section name="contact,newsletter">
<meta name="Robots" content="noindex,follow" />
<txp:else />
<meta name="author" content="NeMe and contributors" />
<meta name="Robots" content="index,follow" />
<meta name="revisit-after" content="10 days" />
</txp:if_section>

<meta name="author" content="NeMe" />
<meta name="geo.region" content="CY" />
<meta name="geo.placename" content="Limassol" />
<meta name="DC.title" content="<txp:page_title />" />


<link rel="home" href="<txp:site_url />" />
<link rel="canonical" href="http://www.neme.org<txp:page_url />" />

<txp:if_description><txp:meta_description /></txp:if_description>

<meta property="og:site_name" content="<txp:site_name />" />
<meta property="og:type" content="website" />
<meta property="og:title" content="<txp:page_title />" />
<txp:if_description><meta property="og:description" content="<txp:meta_description format="" />" /></txp:if_description>
<meta property="og:url" content="http://www.neme.org<txp:page_url />" />

<txp:if_individual_article>
<meta name="twitter:card" content="summary" />
<meta name="twitter:site" content="@nemeorg" />
<meta name="twitter:creator" content="@nemeorg" />
<meta name="twitter:url" content="<txp:permlink />" />
<meta name="twitter:title" content="<txp:page_title />" />
<meta name="twitter:description" content="<txp:if_description><txp:meta_description format="" /><txp:else /><txp:smd_wrap_all transform="strip_tags"><txp:excerpt /></txp:smd_wrap_all></txp:if_description>" />
<txp:if_custom_field name="img_main" value="">
<meta name="twitter:image" content="<txp:images id="3"><txp:image_url /></txp:images>" />
<meta property="og:image" content="http://www.neme.org/images/1087.png" />
<meta property="og:image:width" content="1200" />
<meta property="og:image:height" content="1200" />
<meta property="og:image:alt" content="NeMe logo" />
<txp:else />
<txp:variable name="imgmain"><txp:images break="" sort="rand()" limit="1" id='<txp:custom_field name="img_main" />'><txp:image_info type="id" /></txp:images></txp:variable>
<meta name="twitter:image" content="<txp:images break="" id='<txp:variable name="imgmain" />'><txp:image_url /></txp:images>" />
<meta property="og:image" content="<txp:images break="" id='<txp:variable name="imgmain" />'><txp:image_url /></txp:images>" />
<meta property="og:image:width" content="<txp:images break="" id='<txp:variable name="imgmain" />'><txp:image_info type="width" /></txp:images>" />
<meta property="og:image:height" content="<txp:images break="" id='<txp:variable name="imgmain" />'><txp:image_info type="height" /></txp:images>" />
<meta property="og:image:alt" content="<txp:images break="" id='<txp:variable name="imgmain" />'><txp:image_info type="alt" /></txp:images>" />
</txp:if_custom_field>
<txp:else />
<meta property="og:image" content="http://www.neme.org/images/1087.png" />
<meta property="og:image:width" content="1200" />
<meta property="og:image:height" content="1200" />
<meta property="og:image:alt" content="NeMe logo" />
<meta name="twitter:card" content="summary" />
<meta name="twitter:site" content="@nemeorg" />
<meta name="twitter:creator" content="@nemeorg" />
<meta name="twitter:url" content="http://www.neme.org<txp:page_url />" />
<meta name="twitter:title" content="<txp:page_title />" />
<meta name="twitter:description" content="<txp:meta_description format="" />" />
<meta name="twitter:image" content="<txp:images id="3"><txp:image_url /></txp:images>" />
</txp:if_individual_article>


<txp:feed_link flavor="atom" format="link" label="Atom" section="" category="" />
<txp:feed_link flavor="rss" format="link" label="RSS" section="" category="" />
<txp:hide><link rel="alternate" type="application/json" title="JSON feed" href="<txp:site_url />feed.json" /></txp:hide>

<link rel="icon" href="<txp:site_url />favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-57x57.png" />
<link rel="apple-touch-icon" sizes="60x60" href="/apple-touch-icon-60x60.png" />
<link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-72x72.png" />
<link rel="apple-touch-icon" sizes="76x76" href="/apple-touch-icon-76x76.png" />
<link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114x114.png" />
<link rel="apple-touch-icon" sizes="120x120" href="/apple-touch-icon-120x120.png" />
<link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144x144.png" />
<link rel="apple-touch-icon" sizes="152x152" href="/apple-touch-icon-152x152.png" />
<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon-180x180.png" />
<link rel="icon" type="image/png" href="/favicon-32x32.png" sizes="32x32" />
<link rel="icon" type="image/png" href="/favicon-194x194.png" sizes="194x194" />
<link rel="icon" type="image/png" href="/android-chrome-192x192.png" sizes="192x192" />
<link rel="icon" type="image/png" href="/favicon-16x16.png" sizes="16x16" />
<link rel="manifest" href="/manifest.json" />
<txp:hide><link rel="mask-icon" href="/safari-pinned-tab.svg" color="#ba0000" /></txp:hide>
<meta name="msapplication-TileColor" content="#ffffff" />
<meta name="msapplication-TileImage" content="/mstile-144x144.png" />
<meta name="theme-color" content="#ffffff" />



<txp:hide>
<!-- the google js is no longer working --> 
<txp:if_section name="publications">
<script type="text/javascript" src="http://books.google.com/books/previewlib.js"></script>
</txp:if_section>
<!-- support for battleforthenet.com -->
<script type="text/javascript" src="//widget.battleforthenet.com/widget.min.js" async="async"></script>
</txp:hide>

</head>

<txp:hide>==================-body-======================</txp:hide>

<body id="<txp:if_section name="">front<txp:else /><txp:section /></txp:if_section>" class="no-js">
<span class="anchor" id="landing">&nbsp;</span> <txp:hide>This is needed for anchors to lead to the top of the page. .anchor class in the css has same hight as the fixed menu</txp:hide>

<txp:hide>==================-accessibility-======================</txp:hide>

<div id="accessibility">
<ul>
<li><a href="#menu"><txp:text item="go_menu" /></a></li>
<li><a href="#content"><txp:text item="go_content" /></a></li>
<li><a href="#footer"><txp:text item="go_search" /></a></li>
</ul>
</div>

<txp:hide>==================-menu-======================</txp:hide>

<div id="nav"><div class="container_24">
<div class="grid_24" id="menu">
<nav itemtype="http://schema.org/SiteNavigationElement" itemscope="itemscope"  class="menu" id="menu-primary">
<div class="menu-container">
<div id="menu-toggle-primary">
<a class="open-menu-primary" href="#menu-primary"><span itemprop="image" class="screen-reader-text"><txp:image id="792" class="grid_2" /> Menu</span></a>
<a class="close-menu-primary" href="#"><span itemprop="image" class="screen-reader-text"><txp:image id="792" class="grid_2" /> Close menu</span></a>
</div><!-- .menu-toggle -->
<div class="wrap">
<ul class="menu-items" id="menu-primary-items">
<li><a href="<txp:site_url />" <txp:if_section name="">class="active"</txp:if_section> rel="home">Home</a></li>
<li><a href="<txp:site_url />about/"<txp:if_section name="about"> class="active"</txp:if_section> rel="bookmark">About</a></li>
<li><a href="<txp:site_url />nac/"<txp:if_section name="nac"> class="active"</txp:if_section> rel="bookmark">NAC</a></li>
<li><a href="<txp:site_url />events/"<txp:if_section name="events"> class="active"</txp:if_section> rel="section">Events</a></li>
<li><a href="<txp:site_url />participations/"<txp:if_section name="participations"> class="active"</txp:if_section> rel="section">Participations</a></li>
<li><a href="<txp:site_url />publications/"<txp:if_section name="publications"> class="active"</txp:if_section> rel="bookmark">Publications</a></li>
<li><a href="<txp:site_url />workshops/"<txp:if_section name="workshops"> class="active"</txp:if_section> rel="bookmark">Workshops</a></li>
<li><a href="<txp:site_url />texts/"<txp:if_section name="texts"> class="active"</txp:if_section> rel="bookmark">Texts</a></li>
<li><a href="<txp:site_url />newsletter/"<txp:if_section name="newsletter"> class="active"</txp:if_section> rel="nofollow">Newsletter</a></li>
<li><a href="<txp:site_url />contact/"<txp:if_section name="contact"> class="active"</txp:if_section> rel="nofollow">Contact</a></li>
<li class="nosmall">&nbsp;&nbsp;</li>
<li><a href="http://forum.neme.org/" rel="external">Forum</a></li>
<li><a href="<txp:site_url />related-links/" <txp:if_section name="related-links"> class="active"</txp:if_section> rel="bookmark">Links</a></li><txp:if_logged_in><txp:if_individual_article><li><a href="<txp:site_url />textpattern/index.php?event=article&amp;step=edit&amp;ID=<txp:article_id />"><txp:article_id /></a></li></txp:if_individual_article></txp:if_logged_in>
</ul>
</div>
</div>
</nav>
</div>

<div class="clear">&nbsp;</div>

</div><!-- end .container_24 --></div>

<txp:hide>==================-header-======================</txp:hide>

<div id="header"><div class="container_24">

<div class="grid_2 logo nosmall">
<txp:if_section name="">
<txp:image id="792" />
<txp:else />
<a href="<txp:site_url />" rel="home"><txp:image id="792" /></a>
<small>Est. 2004</small>
</txp:if_section>
</div>

<h1><txp:page_title /></h1>

<div class="clear">&nbsp;</div>

</div><!-- end .container_24 --></div>

<div id="content"><div class="container_24">

<txp:hide>==================-home page-======================</txp:hide>

<txp:if_section name="">
<txp:if_search>
<txp:variable name="searchterm_minchars" value="3" />
<txp:variable name="searchterm_tooshort"><txp:php>global $variable, $q; echo ( strlen(trim($q)) < intval($variable['searchterm_minchars']) ) ? 'yes' : '';
</txp:php></txp:variable>
<txp:article pgonly="1" searchall="0" searchsticky="1" />
<txp:if_search_results>
<h3>You searched for <strong><txp:page_url type="q" /></strong>. <txp:search_result_count />.</h3>
<hr />
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
<txp:article_custom id="1">
<h3><txp:title /></h3>
<txp:excerpt />
<p class="aright"><a href="<txp:site_url />about/">read more&#8230;</a></p>
</txp:article_custom>
</article>

<figure itemscope itemtype="http://schema.org/ImageObject" class="grid_18 slides">
<txp:images category="random" limit="8" sort="rand()" wraptag="ul" break="li" class="rslides">
<a href="/<txp:image_info type="name" />"><txp:image /></a>
</txp:images>
</figure>

<div class="clear">&nbsp;</div>

<div class="grid_6 frontthumbs">
<txp:article_custom limit="10" section="events,participations" label="Activities" labeltag="h3" break="li" wraptag="ul">
<txp:permlink><txp:title /></txp:permlink>
</txp:article_custom>
</div>

<div class="grid_6 frontthumbs">
<txp:article_custom section="texts" limit="10" sort="rand()" break="li" wraptag="ul" labeltag="h3" label="Texts">
<txp:permlink><txp:title /></txp:permlink>
</txp:article_custom>
</div>

<div class="medium">&nbsp;</div>

<div class="grid_6 frontthumbs">
<h3>Forum</h3>
<ul><txp:php> echo file_get_contents('http://forum.neme.org/extern-1.php');</txp:php></ul>
</div>

<txp:hide><div class="grid_6 frontthumbs">
<h3><a href="/participations/">Participations</a></h3>

<txp:images category='<txp:category_list type="image" parent="participations" break=",">
<txp:category type="image" />
</txp:category_list>' sort="rand()" limit="1">
<a href="/participations/"><txp:thumbnail  class="ds image" /></a>
</txp:images>

</div></txp:hide>

	
<div class="grid_6 frontthumbs">
<h3>Announcements</h3>

<div class="announce"><txp:php>echo file_get_contents('http://news.neme.org/?rah_external_output=neme-announce');</txp:php></div>
</div>
<div class="clear">&nbsp;</div>
</txp:if_search>
</txp:if_section>

<txp:hide>==================-article-lists-======================</txp:hide>

<txp:if_article_list>

<txp:hide>==================-about-======================</txp:hide>

<txp:if_section name="about">
<txp:if_search>
<txp:article pgonly="1" searchall="0" searchsticky="1" />
<txp:if_search_results>
<h3>You searched for <strong><txp:page_url type="q" /></strong>. <txp:search_result_count />.</h3>
<hr />
<txp:else />
<p>Your search for <strong><txp:page_url type="q" /></strong> did not match any documents.</p>
<h3>Suggestions:</h3>
<ul><li>Make sure all words are spelled correctly.</li>
<li>Try fewer keywords</li>
<li>Try different keywords</li></ul>
</txp:if_search_results>
<txp:article limit="999" searchall="0" />
<txp:else />
<txp:article_custom id="1">
<figure itemscope itemtype="http://schema.org/ImageObject" class="grid_6 nosmall"><txp:if_custom_field name="pubs">
<txp:images id='<txp:custom_field name="pubs" />' limit="1" sort="rand()" break="">
<a href="<txp:site_url />publications/#book_<txp:image_info type="id" />">img src="<txp:site_url />images/<txp:image_info type="id" /><txp:image_info type="ext" />" width="<txp:image_info type="w" />" height="<txp:image_info type="h" />" title="<txp:image_info type="alt" />" alt="<txp:image_info type="alt" />" class="ds" /></a>
</txp:images>
<txp:else />
<txp:images category='<txp:category_list type="image" parent="events" break="," class="ds"><txp:category type="image" /></txp:category_list>' sort="rand()" limit="1">
<txp:thumbnail class="ds" />
</txp:images>
</txp:if_custom_field></figure>

<figure itemscope itemtype="http://schema.org/ImageObject" class="grid_18">

<txp:images category="random" limit="6" sort="rand()" wraptag="ul" break="li" class="rslides">
<a href="<txp:site_url /><txp:image_info type="name" />"><txp:image /></a>
</txp:images>
</figure>

<div class="clear">&nbsp;</div>
<article class="grid_18" role="main"><txp:body /></article>

<div class="grid_6 frontthumbs" id="side" role="complementary">
<div id="meta"><h4>Address</h4><address>NeMe<br />
poBox 50325<br />
3603 Limassol<br />
Cyprus</address>
</div>
<div class="announce">
<h3>Announcements</h3>
<txp:php>echo file_get_contents('http://news.neme.org/?rah_external_output=neme-announce');</txp:php>
</div>
<div>
<h4>Publications</h4>
<txp:images id='<txp:custom_field name="pubs_by_others" />' sort="alt desc" break="">
<a href="<txp:site_url />publications/#book_<txp:image_info type="id" />"><img src="<txp:site_url />images/<txp:image_info type="id" /><txp:image_info type="ext" />" width="<txp:image_info type="w" />" height="<txp:image_info type="h" />" title="<txp:image_info type="alt" />" alt="<txp:image_info type="alt" />" /></a>
<div class="clear">&nbsp;</div>
</txp:images>
</div>

<txp:recent_articles section="events,participations" limit="10" label="Previous activities" labeltag="h3" break="li" wraptag="ul" class="submenu" />
</div>

<div class="clear">&nbsp;</div>
</txp:article_custom>

<div class="grid_6 frontthumbs">
<h3>Events</h3>
<txp:images category='<txp:category_list type="image" parent="events" break="," class="ds"><txp:category type="image" /></txp:category_list>' sort="rand()" limit="1">
<a href="<txp:site_url />events/"><txp:thumbnail /></a>
</txp:images>
</div>

<div class="grid_6 frontthumbs">
<h3>Publications</h3>

<txp:images category="publications" limit="1" sort="rand()" class="ds" break="">
<a href="<txp:site_url />publications/"><txp:thumbnail /></a>
</txp:images>
</div>

<div class="grid_6 frontthumbs">
<h3>Participations</h3>

<txp:images category='<txp:category_list type="image" parent="participations" break=","><txp:category type="image" /></txp:category_list>' sort="rand()" limit="1" class="ds"><a href="<txp:site_url />participations/"><txp:thumbnail /></a></txp:images>
</div>
	
<div class="grid_6 frontthumbs">
<h3>Workshops</h3>

<txp:images category="workshops" limit="1" sort="rand()" class="ds" break="">
<a href="<txp:site_url />workshops/"><txp:thumbnail /></a>
</txp:images>
</div>

<div class="clear">&nbsp;</div>
</txp:if_search>
</txp:if_section>

<txp:hide>==================-nac-======================</txp:hide>

<txp:if_section name="nac">
<txp:article_custom id="44">
<figure itemscope itemtype="http://schema.org/ImageObject" class="grid_6 nosmall"><txp:if_custom_field name="pubs">
<txp:images id='<txp:custom_field name="pubs" />' limit="1" sort="rand()" break="">
<a href="<txp:site_url />publications/#book_<txp:image_info type="id" />">img src="<txp:site_url />images/<txp:image_info type="id" /><txp:image_info type="ext" />" width="<txp:image_info type="w" />" height="<txp:image_info type="h" />" title="<txp:image_info type="alt" />" alt="<txp:image_info type="alt" />" class="ds" /></a>
</txp:images>
<txp:else />
<txp:images category='<txp:category_list type="image" parent="nac" break="," class="ds"><txp:category type="image" /></txp:category_list>' sort="rand()" limit="1">
<txp:thumbnail class="ds" />
</txp:images>
</txp:if_custom_field></figure>

<figure itemscope itemtype="http://schema.org/ImageObject" class="grid_18"><txp:images category='<txp:category_list type="image" parent="nac" break="," class="ds"><txp:category type="image" /></txp:category_list>' limit="6" sort="rand()" wraptag="ul" break="li" class="rslides">
<txp:image />
</txp:images>
</figure>

<div class="clear">&nbsp;</div>
<article class="grid_18" role="main"><h2><txp:title /></h2><txp:body /></article>

<div class="grid_6 frontthumbs" id="side" role="complementary">
<div id="meta"><h4>Location</h4><address><p>NeMe Arts Centre<br />
Corner of Ellados and Enoseos streets<br />
Limassol<br />
Cyprus</p></address>
<h4>Postal Address</h4>
<address><p>NeMe<br />
poBox 50325<br />
3603 Limassol<br />
Cyprus</p>
</address></div>

<div class="announce"><h3>Announcements</h3>

<txp:php>echo file_get_contents('http://news.neme.org/?rah_external_output=neme-announce');</txp:php></div>

<txp:if_custom_field name="pubs_by_others"><div class="line"><h4 class="line">Publications</h4>
<txp:images id='<txp:custom_field name="pubs_by_others" />' sort="alt desc" break="">
<a href="<txp:site_url />publications/#book_<txp:image_info type="id" />"><img src="<txp:site_url />images/<txp:image_info type="id" /><txp:image_info type="ext" />" width="<txp:image_info type="w" />" height="<txp:image_info type="h" />" title="<txp:image_info type="alt" />" alt="<txp:image_info type="alt" />" class="ds" /></a>
<div class="clear">&nbsp;</div>
</txp:images></div></txp:if_custom_field>

</div>

<txp:article_custom limit="999" label="Previously at NAC" venue="NeMe Arts Centre%" section="events,participations" labeltag="h3" break="li" wraptag="ul" class="submenu">
<txp:permlink><txp:title /></txp:permlink>
</txp:article_custom>

<div class="clear">&nbsp;</div>
</txp:article_custom>

<div class="grid_6 frontthumbs">
<h3>Events</h3>
<txp:images category='<txp:category_list type="image" parent="events" break="," class="ds"><txp:category type="image" /></txp:category_list>' sort="rand()" limit="1">
<a href="<txp:site_url />events/"><txp:thumbnail /></a>
</txp:images>
</div>

<div class="grid_6 frontthumbs">
<h3>Publications</h3>

<txp:images category="publications" limit="1" sort="rand()" class="ds" break="">
<a href="<txp:site_url />publications/"><txp:thumbnail /></a>
</txp:images>
</div>

<div class="grid_6 frontthumbs">
<h3>Participations</h3>

<txp:images category='<txp:category_list type="image" parent="participations" break=","><txp:category type="image" /></txp:category_list>' sort="rand()" limit="1" class="ds"><a href="<txp:site_url />participations/"><txp:thumbnail /></a></txp:images>
</div>
	
<div class="grid_6 frontthumbs">
<h3>Workshops</h3>

<txp:images category="workshops" limit="1" sort="rand()" class="ds" break="">
<a href="<txp:site_url />workshops/"><txp:thumbnail /></a>
</txp:images>
</div>

<div class="clear">&nbsp;</div>
</txp:if_section>

<txp:hide>==================-events-participations-======================</txp:hide>

<txp:if_section name="events,participations">
<txp:if_search>
<txp:article pgonly="1" searchall="0" searchsticky="1" />
<txp:if_search_results>
<h3>You searched for <strong><txp:page_url type="q" /></strong>. <txp:search_result_count />.</h3>
<hr />
<txp:else />
<p>Your search for <strong><txp:page_url type="q" /></strong> did not match any documents.</p>
<h3>Suggestions:</h3>
<ul><li>Make sure all words are spelled correctly.</li>
<li>Try fewer keywords</li>
<li>Try different keywords</li></ul>
</txp:if_search_results>
<txp:article limit="999" searchall="0" />
<txp:else />
<div class="line">


<figure itemscope itemtype="http://schema.org/ImageObject" class="grid_6 nosmall"><txp:images category='<txp:category_list type="image" parent=''<txp:section />'' break=","><txp:category type="image" /></txp:category_list>' sort="rand()" limit="1"><txp:thumbnail class="ds" /></txp:images></figure>

<figure itemscope itemtype="http://schema.org/ImageObject" class=" grid_18"><txp:images category='<txp:category_list type="image" parent=''<txp:section />'' break=","><txp:category type="image" /></txp:category_list>' sort="rand()" limit="6" wraptag="ul" break="li" class="rslides"><txp:image /></txp:images></figure>


<div class="clear">&nbsp;</div></div>

<section><div class="line nosmall">
<div class="grid_5 nosmall"><p>Dates</p></div>
<div class="grid_6 nosmall"><p>Title</p></div>
<div class="grid_13 nosmall"><p>Venue</p></div>
<div class="clear nosmall">&nbsp;</div></div>

<txp:article limit="999">
<article><div class="grid_5"><txp:if_logged_in><p><a href="<txp:site_url />textpattern/index.php?event=article&amp;step=edit&amp;ID=<txp:article_id />"><txp:custom_field name="dates" escape="" /></a></p><txp:else /><p><txp:custom_field name="dates" escape="" /></p></txp:if_logged_in></div>
<div class="grid_6"><h6><a href="<txp:permlink />" rel="bookmark"><txp:title /></a></h6></div>
<div class="grid_13"><txp:if_custom_field name="venues">
<p><txp:custom_field name="venue" escape="" /> <txp:custom_field name="venues" escape="" /></p>
<txp:else />
<p><txp:custom_field name="venue" escape="" /></p>
</txp:if_custom_field></div>
<div class="clearboth"><hr /></div></article>
</txp:article></section>
</txp:if_search>
</txp:if_section>

<txp:hide>==================-texts-======================</txp:hide>

<txp:if_section name="texts">
<txp:if_search>
<txp:article pgonly="1" searchall="0" searchsticky="1" />
<txp:if_search_results>
<h3>You searched for <strong><txp:page_url type="q" /></strong>. <txp:search_result_count />.</h3>
<hr />
<txp:else />
<p>Your search for <strong><txp:page_url type="q" /></strong> did not match any documents.</p>
<h3>Suggestions:</h3>
<ul><li>Make sure all words are spelled correctly.</li>
<li>Try fewer keywords</li>
<li>Try different keywords</li></ul>
</txp:if_search_results>
<txp:article limit="999" searchall="0" />
<txp:else />
<div class="line">

<article class="grid_6 about" role="main">
<p>This page lists all <txp:article_custom section="texts" pageby="1" pgonly /> texts collected for our online visitors since the launch of our site in 2005. If you have a text which is relevant to this database please do <a href="http://news.neme.org/15/submit-a-text" rel="nofollow">submit it</a> to us. We read all submissions.</p>
<!--googleoff: all-->
<p>We apologise that since our site's redesign in October 2016 all of the bookmarks to these texts are broken but it was the only way to move the site forward.</p>
<!--googleoon: all-->
</article>

<figure itemscope itemtype="http://schema.org/ImageObject" class="grid_18 slides">
<txp:images category="random" limit="6" sort="rand()" wraptag="ul" break="li" class="rslides">
<a href="/<txp:image_info type="name" />"><txp:image /></a>
</txp:images>
</figure>

<div class="clear">&nbsp;</div>

<div class="clear">&nbsp;</div></div>

<section><div class="line nosmall">
<div class="grid_6 nosmall"><p>Author</p></div>
<div class="grid_18 nosmall"><p>Title</p></div>
<div class="clear nosmall">&nbsp;</div></div>

<txp:article limit="999">
<article><div class="grid_6"><txp:if_logged_in><a href="<txp:site_url />textpattern/index.php?event=article&amp;step=edit&amp;ID=<txp:article_id />"><txp:linklist id='<txp:custom_field name="venue" escape="" />' wraptag="p" break=" &amp; "><txp:link_name /></txp:linklist></a><txp:else /><txp:linklist id='<txp:custom_field name="venue" escape="" />' wraptag="p" break=" &amp; "><txp:link_name /></txp:linklist></txp:if_logged_in></div>
<div class="grid_18"><h6><a href="<txp:permlink />" rel="bookmark"><txp:title /></a></h6></div>
<hr class="clearboth" /></article>
</txp:article></section>
</txp:if_search>
</txp:if_section>

<txp:hide>==================-contact-======================</txp:hide>

<txp:if_section name="contact">
<div class="clear">&nbsp;</div>

<txp:thumbnail id="166" class="grid_4 nosmall" />

<div class="grid_12">
<txp:zem_contact to="email@domain.tld" label=""  thanks="Thank you, your message has been sent.">
<txp:zem_contact_text name="Name" label="Your name" required="1" /><br />
<txp:zem_contact_text name="Surname" label="Your surname" required="1" /><br />
<txp:zem_contact_email label="Your email" name="Email" required="1" /><br />
<txp:zem_contact_text name="Website" label="Your website" required="0" /><br />
<txp:zem_contact_textarea name="Comment" label="Your question" /><br />
<txp:zem_contact_checkbox required="0" label="Check this box if you wish to subscribe to our newsletter." /><br />
<txp:zem_contact_checkbox label="This is not spam!." /><br />
<txp:zem_contact_serverinfo name="REMOTE_ADDR" label="IP number" />
<txp:zem_contact_serverinfo name="HTTP_USER_AGENT" label="Browser" />
<txp:zem_contact_submit label="Send" />
</txp:zem_contact>
</div>

<div class="grid_6"><div id="meta"><h4>Address</h4><address>NeMe<br />
poBox 50325<br />
3603 Limassol<br />
Cyprus</address></div>
<div class="announce"><h3>Announcements</h3>

<txp:php>echo file_get_contents('http://news.neme.org/?rah_external_output=neme-announce');</txp:php></div>
</div>

<div class="clear">&nbsp;</div>
</txp:if_section>

<txp:hide>==================-publications-======================</txp:hide>

<txp:if_section name="publications">
<txp:article_custom section="events, participations, about" limit="999">
<txp:if_custom_field name="pubs">
<txp:images id='<txp:custom_field name="pubs" />' break="">
<div class="line"><figure itemscope itemtype="http://schema.org/ImageObject"><span itemprop="image" class="grid_6"><txp:permlink><img src="<txp:site_url />images/<txp:image_info type="id" /><txp:image_info type="ext" />" width="<txp:image_info type="w" />" height="<txp:image_info type="h" />" title="<txp:image_info type="alt" />" alt="<txp:image_info type="alt" />" id="book_<txp:image_info type="id" />" /></txp:permlink></span><figcaption itemprop="caption" class="grid_17 prefix_1"><txp:image_info type="caption" escape="" />
<txp:if_logged_in><p><a href="/textpattern/index.php?event=image&amp;step=image_edit&amp;id=<txp:image_info type="id" />">edit</a></p></txp:if_logged_in></figcaption></figure><div class="clear">&nbsp;</div></div>

</txp:images>
</txp:if_custom_field>
</txp:article_custom> 

<div class="line"><h4 class="grid_23 alpha" id="other">Beside the articles appearing in numerous newspapers, magazines and websites showcasing our activities, NeMe and/or IMCA are mentioned in&#8230;</h4><a class="nosmall" href="#landing"><img src="/themes/neme960/styles/top.svg" width="30" height="30" alt="back to top" /></a><div class="clear">&nbsp;</div></div>

<txp:variable name="otherpubs" value='<txp:article_custom section="events, participations, about" limit="999" break=","><txp:if_custom_field name="pubs_by_others"><txp:custom_field name="pubs_by_others" /></txp:if_custom_field></txp:article_custom>' />
<txp:images id='<txp:variable name="otherpubs" />' sort="alt desc" limit="999" break="">
<txp:if_different>
<div class="line"><figure itemscope itemtype="http://schema.org/ImageObject"><span itemprop="image" class="grid_6">
<a href="<txp:site_url /><txp:image_info type="name" />"><img src="<txp:site_url />images/<txp:image_info type="id" /><txp:image_info type="ext" />" alt="<txp:image_info type="alt" />" title="<txp:image_info type="alt" />" width="<txp:image_info type="w" />" height="<txp:image_info type="h" />" id="book_<txp:image_info type="id" />" /></a></span>
<figcaption itemprop="caption" class="grid_17 prefix_1"><txp:image_info type="caption" escape="" /><txp:if_logged_in><p><a href="/textpattern/index.php?event=image&amp;step=image_edit&amp;id=<txp:image_info type="id" />">edit</a></p></txp:if_logged_in></figcaption></figure>
<div class="clear">&nbsp;</div>
</div>
</txp:if_different>
</txp:images>

<div class="line"><h4 class="grid_23 alpha" id="cited">NeMe and/or IMCA published content is cited in&#8230;</h4><a class="nosmall" href="#other"><img src="/themes/neme960/styles/top.svg" width="30" height="30" alt="back to top" /></a><div class="clear">&nbsp;</div></div>

<txp:images category="cite" limit="999" sort="alt desc" break="">
<div class="grid_12 grideven"><figure itemscope itemtype="http://schema.org/ImageObject">
<span itemprop="image" class="grid_3 alpha"><img src="<txp:site_url />images/<txp:image_info type="id" />t<txp:image_info type="ext" />" alt="<txp:image_info type="alt" />" title="<txp:image_info type="alt" />" width="<txp:image_info type="thumb_w" />" height="<txp:image_info type="thumb_h" />" /></span>
<figcaption itemprop="caption" class="grid_9 omega"><txp:image_info type="caption" escape="" />
<txp:if_logged_in><p><a href="/textpattern/index.php?event=image&amp;step=image_edit&amp;id=<txp:image_info type="id" />">edit</a></p></txp:if_logged_in>
</figcaption></figure>
<div class="clear">&nbsp;</div>
</div>
</txp:images>
</txp:if_section>

<txp:hide>==================-workshops-======================</txp:hide>

<txp:if_section name="workshops">
<txp:article_custom id="2">

<figure itemscope itemtype="http://schema.org/ImageObject" class="grid_6 nosmall"><txp:thumbnail id='<txp:custom_field name="img2" />' class="ds" /></figure>
<figure itemscope itemtype="http://schema.org/ImageObject" class="grid_18"><txp:images id='<txp:custom_field name="img_main"/>' wraptag="ul" break="li" class="rslides" sort="rand()" limit="6"><txp:image /></txp:images></figure>
<div class="clear">&nbsp;</div>
<div class="grid_18"><txp:body /></div>
<div class="grid_6">
<div class="announce"><txp:php>echo file_get_contents('http://news.neme.org/?rah_external_output=neme-announce');</txp:php></div>
</div>

<div class="clear">&nbsp;</div>
</txp:article_custom>
</txp:if_section>

<txp:hide>==================-links-======================</txp:hide>

<txp:if_section name="related-links">


<div class="grid_8">
<div id="meta">
<p>This page lists all the venues, sponsors and the people and groups who participated in at least one of the projects we organised or curated in the past <txp:fha_time_diff year="2004" />.</p>
<p>We thank all of them.</p>
<p>If you participated in one of our projects and your name is not here or if we link to a wrong website, please <a rel="nofollow" href="/contact/">let us know</a>.</p>
</div>
</div>
<div>
<h4><txp:php>echo safe_count('txp_link', "category = 'contributors'");</txp:php> people &amp; groups who participated in one or more of our projects</h4>
<txp:linklist category="contributors" limit="999999" sort="linksort" break=" &bull; " wraptag="p"> <txp:variable name="haslink" value='<txp:link_url />' /> <txp:if_variable name="haslink" value="#"> <txp:link_name escape="" /> <txp:else /> <a href="<txp:link_url />" rel="external"><txp:link_name escape="html" /></a> </txp:if_variable> </txp:linklist>

<div class="clear">&nbsp;</div>

<hr />

<div class="announce"><h4>Sponsors</h4>
<p>NeMe seeks, accepts and welcomes sponsorship for its events. To date, here are the organisations who helpped our projects in either a financial or in-kind way.</p>

<txp:linklist category="sponsors" limit="999999" sort="linkname" break=" &bull; " wraptag="p">
<txp:variable name="haslink" value='<txp:link_url />' />
<txp:if_variable name="haslink" value="#">
<txp:link_name escape="html" />
<txp:else />
<a href="<txp:link_url />" rel="external"><txp:link_name escape="html" /></a>
</txp:if_variable>
</txp:linklist></div>

<hr />

<h4>Venues</h4>

<txp:linklist category="venues,venues-featured" limit="999999" sort="linkname" break=" &bull; " wraptag="p">
<txp:variable name="haslink" value='<txp:link_url />' />
<txp:if_variable name="haslink" value="#">
<txp:link_name escape="html" />
<txp:else />
<a href="<txp:link_url />" rel="external"><txp:link_name escape="html" /></a>
</txp:if_variable>
</txp:linklist>


<div class="clear">&nbsp;</div>

<hr />

<div class="announce"><h5 id="site_thanks">For their help and/or advice for the coding of our websites we thank:</h5>

<txp:output_form form="site_thanks" /></div>
</div>

<div class="clear">&nbsp;</div>
</txp:if_section>

<txp:hide>==================-neme-to convert and adapt for news.neme.org-======================

<txp:if_section name="neme">
<div class="grid_24"><h6>This page lists random <a href="<txp:site_url />calls/" rel="external">calls</a>, <a href="http://www.neme.org/arts_info/" rel="external">arts information</a> and <a href="http://www.neme.org/texts/" rel="external">texts</a> from <a href="http://www.neme.org" rel="external">NeMe</a> as well as the latest entries from our <a href="http://forum.neme.org" rel="external">forum</a>.</h6></div><div class="clear">&nbsp;</div>

<txp:php>echo file_get_contents('http://news.neme.org/?rah_external_output=neme-announce');</txp:php>

<div class="grid_6"><h3>Forum</h3>
<ul><txp:php> echo file_get_contents('http://forum.neme.org/extern-1.php');</txp:php></ul>
</div>
<div class="clear">&nbsp;</div>
</txp:if_section>

==================-newsletter-possibly move to blog-======================</txp:hide>

<txp:if_section name="newsletter">
<txp:thumbnail id="166" class="grid_4" />

<div class="grid_10">

<txp:zem_contact to="email@domain.tld" label=""  thanks="Thank you, you are now subscribed to NeMe&#39;s newsletter.">
<txp:zem_contact_text label="Your name" required="1" /><br />
<txp:zem_contact_text label="Your Surname" required="1" /><br />
<txp:zem_contact_email name="Email" label="Your email" required="1" /><br />
<txp:zem_contact_text label="Your website" required="0" /><br />
<txp:zem_contact_checkbox label="Check this box if you wish to subscribe to our newsletter" /><br />
<txp:zem_contact_serverinfo name="REMOTE_ADDR" label="IP number" />
<txp:zem_contact_serverinfo name="HTTP_USER_AGENT" label="Browser" />
<txp:zem_contact_submit label="Subscribe" />
</txp:zem_contact>

<txp:php>echo file_get_contents('http://news.neme.org/?rah_external_output=newsletter');</txp:php>
</div>


<div class="grid_10">
<p>By filling this form you agree to receive emails from NeMe&#47;IMCA regarding our calls for participation, invitations and information about our events. These emails will be very infrequent. Should you wish to unsubscribe, we always provide a link for that in our newsletter.</p>

<p>Due to the nature of our newsletter system (automatic output to numerous users), emails sent to you maybe falsely detected as spam by some mail clients. As such, those who have online email addresses such as gmail, ymail or hotmail, but receive their emails via an email client such as outlook or apple mail, may not receive our newsletter unless they log into their emails on site and remove them from the automated spam filters.</p>

<p>NeMe will not disclose your email address or other details to anyone else without your explicit permission (we, as well as our <txp:php>echo file_get_contents('http://news.neme.org/?rah_external_output=subscribers');</txp:php> subscribers hate spam too!).</p>

<p>A link to our privacy policy can be found on the bottom of the page.</p>


</div>

<div class="clear">&nbsp;</div>
</txp:if_section>

</txp:if_article_list>

<txp:hide>==================-individual articles-======================</txp:hide>

<txp:if_individual_article>

<txp:hide>==================-individual events-participations-======================</txp:hide>

<txp:if_article_section name="events,participations">
<txp:article form=""><figure itemscope itemtype="http://schema.org/ImageObject" class="grid_6 nosmall">
<txp:images limit="1" sort="rand()" id='<txp:custom_field name="img2" />' break="">
<txp:thumbnail class="ds" /></txp:images></figure>
<figure itemscope itemtype="http://schema.org/ImageObject" class="grid_18"><txp:variable name="aimg" value='<txp:custom_field name="img_main" />' /> <txp:if_variable name="aimg" value="">&nbsp;<txp:else /><txp:images id='<txp:variable name="aimg" />' sort="rand()" limit="6" wraptag="ul" break="li" class="rslides"><txp:image /></txp:images></txp:if_variable></figure>
<div class="clear">&nbsp;</div>

<div class="grid_18" role="main" id="main">
<txp:body />
</div>

<div class="grid_6" id="side" role="complementary">
<div id="meta">
<txp:if_custom_field name="venues"><h5>Venues</h5>
<p><txp:custom_field name="venue" escape="" /> <txp:custom_field name="venues" /></p>
<txp:else />
<h5>Venue</h5>
<p><txp:custom_field name="venue" /></p>
</txp:if_custom_field>
<h5>Dates</h5>
<p><txp:custom_field name="dates" escape="" /></p>
</div>

<div class="announce"><h3>Announcements</h3>

<txp:php>echo file_get_contents('http://news.neme.org/?rah_external_output=neme-announce');</txp:php></div>


<txp:variable name="publs" value='<txp:custom_field name="pubs_by_others" /><txp:custom_field name="pubs" /><txp:custom_field name="multi_event_pubs" />' />

<txp:if_variable name="publs" value="">
<txp:else />
<h4>Publications</h4>
</txp:if_variable>

<txp:if_custom_field name="multi_event_pubs">
<txp:images id='<txp:custom_field name="multi_event_pubs" />' break="">
<a href="<txp:site_url />publications/#book_<txp:image_info type="id" />"><img src="<txp:site_url />images/<txp:image_info type="id" /><txp:image_info type="ext" />" width="<txp:image_info type="w" />" height="<txp:image_info type="h" />" title="<txp:image_info type="alt" />" alt="<txp:image_info type="alt" />" /></a>
</txp:images>
</txp:if_custom_field>

<txp:if_custom_field name="pubs">
<txp:images id='<txp:custom_field name="pubs" />' break="">
<a href="<txp:site_url />publications/#book_<txp:image_info type="id" />"><img src="<txp:site_url />images/<txp:image_info type="id" /><txp:image_info type="ext" />" width="<txp:image_info type="w" />" height="<txp:image_info type="h" />" title="<txp:image_info type="alt" />" alt="<txp:image_info type="alt" />" /></a>
</txp:images>
</txp:if_custom_field>

<txp:if_custom_field name="pubs_by_others">
<txp:images id='<txp:custom_field name="pubs_by_others" />' break="">
<a href="<txp:site_url />publications/#book_<txp:image_info type="id" />"><img src="<txp:site_url />images/<txp:image_info type="id" /><txp:image_info type="ext" />" width="<txp:image_info type="w" />" height="<txp:image_info type="h" />" title="<txp:image_info type="alt" />" alt="<txp:image_info type="alt" />" /></a>
</txp:images>
</txp:if_custom_field>

<txp:if_variable name="publs" value="">
<txp:else />
<div class="clear">&nbsp;</div></txp:if_variable>

<div class="sub"><txp:article_custom label='Other <txp:section />' labeltag="h4" section='<txp:section />' limit="600" wraptag="ul" class="submenu">
<txp:if_article_id><li><span><txp:title /></span></li><txp:else /><li><a href="<txp:permlink />" rel="bookmark"><txp:title /></a></li></txp:if_article_id>
</txp:article_custom></div>

</div>
<div class="clear">&nbsp;</div>
</txp:article>
</txp:if_article_section>

<txp:hide>==================-individual about-======================</txp:hide>

<txp:if_article_section name="about">
<txp:article form="">
<article class="grid_18" role="main">
<txp:body />
</article>
</txp:article>
<div class="grid_6 frontthumbs" id="side" role="complementary">
 <div id="meta"><h4>Address</h4><address>NeMe<br />
poBox 50325<br />
3603 Limassol<br />
Cyprus</address>
 </div>
 <div class="announce">
<h3>Announcements</h3>
<txp:php>echo file_get_contents('http://news.neme.org/?rah_external_output=neme-announce');</txp:php>
 </div>
</div>
</txp:if_article_section>

<txp:hide>==================-individual texts-======================</txp:hide>

<txp:if_article_section name="texts">
<txp:article form="">
<article class="grid_18" role="main">
<txp:body />
</article>
<div class="grid_6" id="side" role="complementary">
<div itemscope itemtype="http://schema.org/Person" id="meta">
<p class="linklist">Text by <txp:linklist id='<txp:custom_field name="venue" escape="" />' break=" &amp; " wraptag="">
<txp:variable name="linkurl" value='<txp:link_url />' />
<txp:if_variable name="linkurl" value="#">
<span itemscope itemtype="http://schema.org/Text"><span itemprop="author"><txp:link_name /></span></span>
<txp:else />
<a rel="author external" href="<txp:link_url />"><txp:link_name /></a>
</txp:if_variable>
</txp:linklist></p>
<time class="published" datetime="<txp:posted format="%Y-%m-%dT%T" />">
Posted: <txp:posted format="%b %d, %Y" /></time>
</div>

<div class="announce"><h3>Announcements</h3>

<txp:php>echo file_get_contents('http://news.neme.org/?rah_external_output=neme-announce');</txp:php></div>

<div class="sub">
<txp:etc_query name="find" data='<txp:custom_field name="venue" />' markup="list" break=" OR " >FIND_IN_SET({?}, custom_3)</txp:etc_query>
<txp:if_variable name="find">
<txp:etc_query name="relatedtitles" data='(<txp:variable name="find" />) AND ID != <txp:article_id />' markup="db" populate="article"  wraptag="ul" class="related_articles" label="More texts by the author" labeltag="h4">
<txp:variable name="relatedtexts" value='<txp:variable name="relatedtexts" />,<txp:article_id />' />
{$<({#row}|21).?(<li><a href="<txp:permlink />"><txp:title /></a></li>)}
</txp:etc_query>
</txp:if_variable>
<txp:variable name="relatedtitles" />
<txp:article_custom sort="rand()" section="texts" exclude='<txp:article_id />,<txp:variable name="relatedtexts" />' limit='<txp:if_variable name="relatedtexts">15<txp:else />20</txp:if_variable>' break="li" wraptag="ul" class="submenu" label="Other Texts" labeltag="h4">
<a href="<txp:permlink />"><txp:title /></a>
</txp:article_custom>
</div>

<txp:if_custom_field name="pubs_by_others">
<txp:images id='<txp:custom_field name="pubs_by_others" />'>
<div class="nosmall"><h4>Off line reading</h4>
<a rel="external" href="<txp:image_info type="caption" />"><txp:image /></a>
</txp:images></div>
</txp:if_custom_field>

</div>
</txp:article>
</txp:if_article_section>

<txp:hide>==================-end individual articles-======================</txp:hide>

</txp:if_individual_article>
<div class="clear">&nbsp;</div>
<span class="grid_1 prefix_23 nosmall"><a href="#landing"><img src="/themes/neme960/styles/top.svg" width="30" height="30" alt="back to top" /></a></span>
<div class="clear">&nbsp;</div>

</div><!-- end .container_24 --></div>
<txp:output_form form="colak_foot" />

<txp:oui_cookie name="accept_cookies" values="yes" />

<!--googleoff: all-->
<txp:oui_if_cookie name="accept_cookies">
<txp:else />
<div id="eucookies" class="noprint"><div class="container_24">
<p class="grid_18">To make sure that this website remains accessible in the European Union, we are forced to include this annoying notice so as to alert you that this website, like most of the websites in the world, uses cookies. We do not profile you or use the data for any commercial purposes except to study ways to enhance user experiance in this site. By continuing to use the site, we assume that you are happy with that. You can find out more about our use of cookies by reading our <a rel="nofollow" href="http://www.neme.org/about/privacy-policy">privacy policy</a>.</p>
<p class="grid_6"><a rel="nofollow" href="?accept_cookies=yes">Agree</a></p>
</div></div>
</txp:oui_if_cookie>
<!--googleon: all-->

<txp:output_form form="javascripts" />
</body>
</html>
