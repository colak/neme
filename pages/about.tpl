<txp:php>
if (isset($_POST['submit'])) {
$url = $_POST['site'].$_POST['terms'];
if ($_POST['section'] && ($_POST['section'] != 'null')) $url = $url.'&s='.$_POST['section'];
header('Location: '.$url);
} else {
header('content-type: text/html; charset=utf-8');
}
</txp:php>

<txp:evaluate query='"<txp:site_url trim="/" /><txp:page_url type="req" />" != "<txp:page_url context />"'>
    <txp:txp_die status="404" />
</txp:evaluate>

<txp:if_logged_in group="publisher" not><txp:pat_speeder gzip="0"/></txp:if_logged_in>

<!doctype html>
<html lang="en-gb">

<head>
<title><txp:page_title /></title>
<meta charset="utf-8">
<txp:hide><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></txp:hide>
<meta name="generator" content="Textpattern CMS"/>
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="format-detection" content="telephone=no" />
<txp:act_if_mobile><meta http-equiv="x-rim-auto-match" content="none" /></txp:act_if_mobile>
<meta name="apple-mobile-web-app-capable" content="yes">

<txp:css name="default" format="flat.link" media="all" />
<txp:if_article_list><txp:css name="articlelists" format="flat.link" media="all" /></txp:if_article_list>
<!--[if IE]><txp:css name="ie-fluid" format="flat.link" /><![endif]-->
<!--[if IE 7]><txp:css name="ie7" format="flat.link" /><![endif]-->
<!--[if gte IE 9]<style type="text/css">nav li {filter: none;}</style><![endif]-->
<txp:act_if_mobile><txp:css name="mobile" format="flat.link" media="screen" /></txp:act_if_mobile>
<txp:css name="print" format="flat.link" media="print" />


<txp:if_article_id id="2240,2241">
<meta name="Robots" content="noindex,follow" />
<txp:else />
<meta name="author" content="NeMe" />
<meta name="Robots" content="index,follow" />
<meta name="revisit-after" content="10 days" />
</txp:if_article_id>

<meta name="geo.region" content="CY" />
<meta name="geo.placename" content="Limassol" />
<meta name="DC.title" content="<txp:page_title />" />


<link rel="home" href="<txp:site_url />" />
<txp:if_search>
<link rel="canonical" href="<txp:site_url trim="/" /><txp:page_url escape="" />" />
<txp:else />
<txp:if_article_list>
<link rel="canonical" href="<txp:page_url context />" />
<txp:else />
<link rel="canonical" href="<txp:permlink />" />
</txp:if_article_list>
</txp:if_search>

<txp:if_description><txp:meta_description /></txp:if_description>

<meta property="og:site_name" content="<txp:site_name />" />
<meta property="og:type" content="website" />
<meta property="og:title" content="<txp:page_title />" />
<txp:if_description><meta property="og:description" content="<txp:meta_description format="" />" /></txp:if_description>
<meta property="og:url" content="<txp:site_url trim="/" /><txp:page_url />" />

<txp:if_individual_article>
<meta name="twitter:card" content="summary" />
<meta name="twitter:site" content="@nemeorg" />
<meta name="twitter:creator" content="@nemeorg" />
<meta name="twitter:url" content="<txp:permlink />" />
<meta name="twitter:title" content="<txp:page_title />" />
<meta name="twitter:description" content="<txp:if_description><txp:meta_description format="" /><txp:else /><txp:excerpt escape="textile,tags,html" /></txp:if_description>" />
<txp:if_custom_field name="img_main" value="">
<meta name="twitter:image" content="<txp:images id="3"><txp:image_url /></txp:images>" />
<meta property="og:image" content="<txp:site_url />images/1087.jpg" />
<meta property="og:image:width" content="1200" />
<meta property="og:image:height" content="400" />
<meta property="og:image:alt" content="NeMe logo" />
<txp:else />
<txp:variable name="imgmain"><txp:images break="" sort="rand()" limit="1" id='<txp:custom_field name="img_main" />'><txp:image_info type="id" /></txp:images></txp:variable>
<meta name="twitter:image" content="<txp:images break="" id='<txp:variable name="imgmain" />'><txp:image_url /></txp:images>" />
<meta property="og:image" content="<txp:images break="" id='<txp:variable name="imgmain" />'><txp:image_url /></txp:images>" />
<meta property="og:image:width" content="<txp:images break="" id='<txp:variable name="imgmain" />'><txp:image_info type="w" /></txp:images>" />
<meta property="og:image:height" content="<txp:images break="" id='<txp:variable name="imgmain" />'><txp:image_info type="h" /></txp:images>" />
<meta property="og:image:alt" content="<txp:images break="" id='<txp:variable name="imgmain" />'><txp:image_info type="alt" /></txp:images>" />
</txp:if_custom_field>
<txp:else />
<meta property="og:image" content="<txp:site_url />images/1087.jpg" />
<meta property="og:image:width" content="1200" />
<meta property="og:image:height" content="400" />
<meta property="og:image:alt" content="NeMe logo" />
<meta name="twitter:card" content="summary" />
<meta name="twitter:site" content="@nemeorg" />
<meta name="twitter:creator" content="@nemeorg" />
<meta name="twitter:url" content="<txp:site_url trim="/" /><txp:page_url />" />
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

</head>

<txp:hide>==================-body-======================</txp:hide>


<body id="<txp:if_section name="">front<txp:else /><txp:section /></txp:if_section>" class="no-js">
<span class="anchor" id="landing">&nbsp;</span> <txp:hide>This is needed for anchors to lead to the top of the page. .anchor class in the css has same hight as the fixed menu</txp:hide>

<txp:hide>==================-accessibility-======================</txp:hide>

<div id="accessibility">
<ul>
<li><a href="#menu">go to menu</a></li>
<li><a href="#content">go to content</a></li>
<li><a href="#footer">go to search</a></li>
</ul>
</div>

<txp:hide>==================-menu-======================</txp:hide>


<img src="<txp:page_url type="theme_path" />/forms/svg/neme_white.svg" alt="NeMe logo" class="logo" width="50" height="50" />

<txp:output_form form="colak_menu" />

<txp:hide>==================-social-======================</txp:hide>

<txp:act_if_mobile><txp:else />
<div class="share large nosmall noprint">
<a href="http://www.facebook.com/sharer/sharer.php?u=<txp:permlink />&amp;t=<txp:site_url trim="/" /><txp:page_url />" rel="nofollow" title="Share on Facebook"><img src="<txp:page_url type="theme_path" />/forms/svg/sm_facebook.svg" width="30" height="30" alt="share on facebook" /></a>
<a href="http://www.twitter.com/intent/tweet?url=<txp:site_url trim="/" /><txp:page_url />" rel="nofollow" title="Share on Twitter"><img src="<txp:page_url type="theme_path" />/forms/svg/sm_twitter.svg" width="30" height="30" alt="share on twitter"/></a>
<a href="http://www.reddit.com/submit?url=<txp:site_url trim="/" /><txp:page_url />" rel="nofollow" title="Share on Reddit"><img src="<txp:page_url type="theme_path" />/forms/svg/sm_redit.svg" width="30" height="30" alt="share on Redit"/></a>
</div>
</txp:act_if_mobile>

<div id="content"><div class="container_24">


<txp:hide>==================-article-lists-======================</txp:hide>

<txp:if_article_list>

<txp:hide>==================-about-======================</txp:hide>

<txp:if_section name="about">
<txp:if_search>
<txp:article pgonly="1" searchall="0" searchsticky="0" />
<txp:if_search_results max="200">
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
<txp:article_custom id="2001">
<figure itemscope itemtype="http://schema.org/ImageObject" class="grid_6 nosmall noprint"><txp:if_custom_field name="pubs">
<txp:images id='<txp:custom_field name="pubs" />' limit="1" sort="rand()" break="">
<a href="<txp:site_url />publications/#book_<txp:image_info type="id" />">img src="<txp:site_url />images/<txp:image_info type="id" /><txp:image_info type="ext" />" width="<txp:image_info type="w" />" height="<txp:image_info type="h" />" title="<txp:image_info type="alt" />" alt="<txp:image_info type="alt" />" class="ds" /></a>
</txp:images>
<txp:else />
<txp:images category='<txp:category_list type="image" parent="events" break="," class="ds"><txp:category type="image" /></txp:category_list>' sort="rand()" limit="1">
<txp:thumbnail class="ds" />
</txp:images>
</txp:if_custom_field></figure>

<figure itemscope itemtype="http://schema.org/ImageObject" class="grid_18">

<txp:images category="random" limit='<txp:act_if_mobile>5<txp:else />8</txp:act_if_mobile>' sort="rand()" wraptag="ul" break="li" class="rslides">
<txp:permlink id='<txp:image_info type="name" />'><txp:image /></txp:permlink>
</txp:images>
</figure>

<div class="clear">&nbsp;</div>
<div class="clear">&nbsp;</div>
<article class="grid_18" role="main">
<h1><txp:title /></h1>
<!--googleoff: all--><p class="printonly"><txp:site_url trim="/" /><txp:page_url /></p><!--googleon: all-->
<txp:body /></article>

<div class="grid_6 frontthumbs" id="side" role="complementary">
<div id="meta">


<h4>Address<txp:if_logged_in> <a class="noprint" href="<txp:site_url />textpattern/index.php?event=article&amp;step=edit&amp;ID=2001"><txp:article_id /></a></txp:if_logged_in></h4>
<address>
<p>NeMe Arts Centre<br />
Corner of Ellados and Enoseos streets<br />
Limassol<br />
Cyprus</p></address>
<h4>Postal Address</h4>
<address><p>NeMe<br />
poBox 50325<br />
3603 Limassol<br />
Cyprus</p>
</address>

</div>
<div class="clear">&nbsp;</div>

<txp:output_form form="announce" />

<txp:output_form form="social_logos" />
<div class="sub"><txp:article_custom label="More" labeltag="h3" section='<txp:section />' exclude="2001,2240,2241" limit="600" wraptag="ul" class="submenu">
<txp:if_article_id><li><span><txp:title /></span></li><txp:else /><li><a href="<txp:permlink />" rel="bookmark"><txp:title /></a></li></txp:if_article_id>
</txp:article_custom></div>

<txp:recent_articles section="projects,participations" limit="10" label="Previous activities" labeltag="h3" break="li" wraptag="ul" class="submenu" />

<h4>Publications (random)</h4><div class="grid_24">
<txp:images id='<txp:custom_field name="pubs_by_others" />' sort="rand()" limit="6" ><txp:hide>sort="alt desc"breakby="2" break="<div class='clear'>&nbsp;</div>"</txp:hide>
<div class="otherpubs"><a href="<txp:site_url />publications/#book_<txp:image_info type="id" />"><img src="<txp:site_url />images/<txp:image_info type="id" /><txp:image_info type="ext" />" width="<txp:image_info type="w" />" height="<txp:image_info type="h" />" title="<txp:image_info type="alt" />" alt="<txp:image_info type="alt" />" /></a></div>
</txp:images>
</div>
<div class="clear">&nbsp;</div>

</div>

<div class="clear">&nbsp;</div>
</txp:article_custom>

<div class="grid_6 nosmall frontthumbs">
<h3>Projects</h3>
<txp:images category='<txp:category_list type="image" parent="events" break="," class="ds"><txp:category type="image" /></txp:category_list>' sort="rand()" limit="1">
<a href="<txp:site_url />projects/"><txp:thumbnail /></a>
</txp:images>
</div>

<div class="grid_6 nosmall frontthumbs">
<h3>Publications</h3>

<txp:images category="publications" limit="1" sort="rand()" class="ds" break="">
<a href="<txp:site_url />publications/"><txp:thumbnail /></a>
</txp:images>
</div>

<div class="grid_6 nosmall frontthumbs">
<h3>Participations</h3>

<txp:images category='<txp:category_list type="image" parent="participations" break=","><txp:category type="image" /></txp:category_list>' sort="rand()" limit="1" class="ds"><a href="<txp:site_url />participations/"><txp:thumbnail /></a></txp:images>
</div>
	
<div class="grid_6 nosmall frontthumbs">
<h3>Workshops</h3>

<txp:images category="workshops" limit="1" sort="rand()" class="ds" break="">
<a href="<txp:site_url />workshops/"><txp:thumbnail /></a>
</txp:images>
</div>

<div class="clear">&nbsp;</div>
</txp:if_search>
</txp:if_section>

<div class="clear">&nbsp;</div>
</txp:if_section>

</txp:if_article_list>

<txp:hide>==================-individual articles-======================</txp:hide>

<txp:if_individual_article>



<txp:hide>==================-individual about-======================</txp:hide>


<txp:hide>=============================-live-========================</txp:hide>

<txp:article form="" status="live">
<txp:article_custom id='<txp:article_id />'>
<figure itemscope itemtype="http://schema.org/ImageObject" class="grid_6 nosmall"><txp:images id='<txp:custom_field name="img2" />' wraptag="" break="" sort="rand()" limit="1"><txp:thumbnail class="ds" /></txp:images></figure>
<figure itemscope itemtype="http://schema.org/ImageObject" class="grid_18"><txp:images id='<txp:custom_field name="img_main"/>' wraptag="ul" break="li" class="rslides" sort="rand()" limit='<txp:act_if_mobile>3<txp:else />8</txp:act_if_mobile>'><txp:image /></txp:images></figure></txp:article_custom>
<div class="clear">&nbsp;</div>

<article class="grid_18" role="main">
<h1><txp:title /></h1>
<!--googleoff: all--><p class="printonly"><txp:site_url trim="/" /><txp:page_url /></p><!--googleon: all-->
<txp:body />
</article>
</txp:article>
<div class="grid_6 frontthumbs" id="side" role="complementary">
 <div id="meta">
<h4>Address<txp:if_logged_in> <a class="noprint" href="<txp:site_url />textpattern/index.php?event=article&amp;step=edit&amp;ID=<txp:article_id />"><txp:article_id /></a></txp:if_logged_in></h4>
<address><p>NeMe Arts Centre<br />
Corner of Ellados and Enoseos streets<br />
Limassol<br />
Cyprus</p></address>
<h4>Postal Address</h4>
<address><p>NeMe<br />
poBox 50325<br />
3603 Limassol<br />
Cyprus</p>
</address>
</div>
<div class="clear">&nbsp;</div>


<txp:output_form form="announce" />

<txp:output_form form="social_logos" />

<div class="sub"><txp:article_custom label="More" labeltag="h3" section='<txp:section />' exclude="2001,2240,2241" limit="600" wraptag="ul" class="submenu">
<txp:if_article_id><li><span><txp:title /></span></li><txp:else /><li><a href="<txp:permlink />" rel="bookmark"><txp:title /></a></li></txp:if_article_id>
</txp:article_custom></div>
</div>

<txp:hide>==================-end individual articles-======================</txp:hide>

</txp:if_individual_article>
<div class="clear">&nbsp;</div>
<span class="grid_1 prefix_23 nosmall noprint"><a href="#landing"><img src="<txp:page_url type="theme_path" />/forms/svg/top.svg" width="30" height="30" alt="back to top" /></a></span>
<div class="clear">&nbsp;</div>

</div><!-- end .container_24 --></div>

<txp:output_form form="colak_foot" />
<txp:output_form form="cookies" />
<txp:output_form form="javascripts" />

</body>
</html>
