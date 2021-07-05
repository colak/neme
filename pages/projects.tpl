<txp:php>
if (isset($_POST['submit'])) {
$url = $_POST['site'].$_POST['terms'];
if ($_POST['section'] && ($_POST['section'] != 'null')) $url = $url.'&s='.$_POST['section'];
header('Location: '.$url);
} else {
header('content-type: text/html; charset=utf-8');
}
</txp:php>

<txp:if_logged_in group="publisher" not><txp:pat_speeder gzip="1"/></txp:if_logged_in>

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

<txp:hide><link rel="stylesheet" href="<txp:page_url type="theme_path" />/styles/fonts.css"></txp:hide>
<txp:css name="default" format="flat.link" media="all" />
<txp:if_article_list><txp:css name="articlelists" format="flat.link" media="all" /></txp:if_article_list>
<!--[if IE]><txp:css name="ie-fluid" format="flat.link" /><![endif]-->
<!--[if IE 7]><txp:css name="ie7" format="flat.link" /><![endif]-->
<!--[if gte IE 9]<style type="text/css">nav li {filter: none;}</style><![endif]-->
<txp:act_if_mobile><txp:css name="mobile" format="flat.link" media="screen" /></txp:act_if_mobile>
<txp:css name="print" format="flat.link" media="print" />

<meta name="author" content="NeMe" />
<txp:evaluate query='contains("<txp:page_url />","?accept_")'>
<meta name="Robots" content="noindex,nofollow" />
<txp:else />
<meta name="Robots" content="index,follow" />
</txp:evaluate>
<meta name="revisit-after" content="10 days" />


<meta name="geo.region" content="CY" />
<meta name="geo.placename" content="Limassol" />
<meta name="DC.title" content="<txp:page_title />" />


<link rel="home" href="<txp:site_url />" />
<txp:if_search>
<link rel="canonical" href="<txp:site_url trim="/" /><txp:page_url escape="" />" />
<txp:else />
<txp:if_article_list>
<link rel="canonical" href="<txp:site_url trim="/" /><txp:page_url />" />
<txp:else />
<txp:evaluate query='contains("<txp:page_url />","?accept_")'>
<txp:else />
<link rel="canonical" href="<txp:permlink />" />
</txp:evaluate>
</txp:if_article_list>
</txp:if_search>

<txp:if_description><txp:meta_description /></txp:if_description>

<meta property="og:site_name" content="<txp:site_name />" />
<meta property="og:type" content="website" />
<meta property="og:title" content="<txp:page_title />" />
<txp:if_description><meta property="og:description" content="<txp:meta_description format="" />" /></txp:if_description>
<txp:if_article_list>
<meta property="og:url" content="<txp:site_url trim="/" /><txp:page_url />" />
<txp:else />
<meta property="og:url" content="<txp:permlink />" />
</txp:if_article_list>

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

<img src="<txp:page_url type="theme_path" />/forms/svg/neme_white.svg" alt="NeMe logo" class="logo" width="50" height="50" />

<txp:output_form form="colak_menu" />

<txp:hide>==================-social-======================</txp:hide>

<txp:act_if_mobile not>
<aside class="share large nosmall noprint">
<a href="http://www.facebook.com/sharer/sharer.php?u=<txp:permlink />&amp;t=<txp:site_url trim="/" /><txp:page_url />" rel="nofollow" title="Share on Facebook"><img src="<txp:page_url type="theme_path" />/forms/svg/sm_facebook.svg" width="30" height="30" alt="share on facebook" loading="lazy"/></a>
<a href="http://www.twitter.com/intent/tweet?url=<txp:site_url trim="/" /><txp:page_url />" rel="nofollow" title="Share on Twitter"><img src="<txp:page_url type="theme_path" />/forms/svg/sm_twitter.svg" width="30" height="30" alt="share on twitter" loading="lazy"/></a>
<a href="http://www.reddit.com/submit?url=<txp:site_url trim="/" /><txp:page_url />" rel="nofollow" title="Share on Reddit"><img src="<txp:page_url type="theme_path" />/forms/svg/sm_redit.svg" width="30" height="30" alt="share on Redit" loading="lazy"/></a>
</aside>
</txp:act_if_mobile>
<div id="content"><div class="container_24">

<txp:hide>==================-article-lists-======================</txp:hide>

<txp:if_article_list>

<txp:hide>==================-projects-======================</txp:hide>

<txp:if_section name="projects">

<txp:hide>==================-search-======================</txp:hide>
<txp:if_search>
<txp:article pgonly="1" searchall="1" searchsticky="0" />
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
<txp:article limit="999" searchall="1" />
<txp:else />
<div class="noprint">


<txp:hide>==================-slides-======================</txp:hide>

<figure itemscope itemtype="http://schema.org/ImageObject" class="grid_6 nosmall noprint"><txp:images category='<txp:category_list type="image" parent=''<txp:if_category><txp:category /><txp:else />events</txp:if_category>'' break=","><txp:category type="image" /></txp:category_list>' sort="rand()" limit="1"><txp:thumbnail class="ds noprint" loading="lazy" /></txp:images></figure>

<figure itemscope itemtype="http://schema.org/ImageObject" class="grid_18 noprint"><txp:images category='<txp:category_list type="image" parent=''<txp:if_category><txp:category /><txp:else />events</txp:if_category>'' break=","><txp:category type="image" /></txp:category_list>' sort="rand()" limit='<txp:act_if_mobile>6<txp:else />8</txp:act_if_mobile>' wraptag="ul" break="li" class="rslides"><txp:image loading="lazy" /></txp:images></figure>

<div class="clear">&nbsp;</div></div>

<txp:variable name="cat1" value='<txp:page_url type="2" />' /> 
<txp:variable name="cat2" value='<txp:page_url type="3" />' />

<txp:hide>==================-category 1-======================</txp:hide>

<txp:if_category>
<txp:if_variable name="cat2" value="">
<div class="grid_24 noprint">
<txp:article status limit="1" listform="" form="" c10="">
<div class="grid_24 aright">
<p aria-label="Breadcrumb" class="aright breadcrumb">&hellip; / <txp:section link="1" /> / <span aria-current="page"><txp:category1 /> /</span></p></div>
<div class="clear">&nbsp;></div>
</txp:article>
<main aria-label="main content" itemscope itemtype="https://schema.org/CollectionPage">
<txp:article_custom listform="" form="" section='<txp:section />' category='<txp:category />' Type="sponsors" status="sticky" limit="1">
<article><txp:body /><txp:if_logged_in group="publisher"><p><a class="noprint" href="<txp:site_url />textpattern/index.php?event=article&amp;step=edit&amp;ID=<txp:article_id />">Edit</a></txp:if_logged_in></article>
</txp:article_custom>
<txp:article status limit="300" listform="list_cat2_projects" form="" c10="" />
<txp:article_custom listform="" form="" section='<txp:section />' category='<txp:category />' Type="sponsors" status="sticky" limit="1">
<txp:if_excerpt>
<div class="eu">
<txp:excerpt />
<div class="clear">&nbsp;</div>
</div>
</txp:if_excerpt>
</txp:article_custom>
</main>
</div>
<txp:else />

<txp:hide>==================-Category 2-======================</txp:hide>
<div class="grid_24 noprint">
<txp:article limit="1" listform="" match="Category1=2, Category2=3" form="" c10="y">
<p aria-label="Breadcrumb" class="aright">&hellip; / <txp:section link="1" /> / <a href="/<txp:section />/<txp:category1 />/"><txp:category1 /></a> / <txp:category2 /> /</p>
</div>
<div class="clear">&nbsp;</div>
</txp:article>
<main aria-label="main content"" itemscope itemtype="https://schema.org/CollectionPage">
<txp:article_custom listform="" form="" section='<txp:section />' match="Category1=2, Category2=3" status="sticky" limit="1">
<txp:variable name="bod"><txp:body /></txp:variable>
<txp:if_variable name="bod">
<article>
<txp:body />
</article>
</txp:if_variable>
</txp:article_custom>
<txp:article limit="999" listform="list_cat_projects" match="Category1=2, Category2=3" form="" c10="y" />
<txp:article_custom listform="" form="" section='<txp:section />' match="Category1=2, Category2=3" status="sticky" limit="1">
<txp:if_custom_field name="Type">
<txp:output_form form='<txp:custom_field name="Type" />' />
</txp:if_custom_field>
</txp:article_custom>
</main>
</txp:if_variable>

<txp:else />
<txp:hide>==================-section landing page-======================</txp:hide>
<main aria-label="main content" itemscope itemtype="https://schema.org/CollectionPage"><div class="line nosmall">
<div class="grid_5 nosmall"><p>Dates</p></div>
<div class="grid_6 nosmall"><p>Title</p></div>
<div class="grid_13 nosmall"><p>Venue</p></div>
<div class="clear nosmall noprint">&nbsp;</div></div>

<txp:article_custom status section="projects" c10="x" form="" limit="999">
<txp:if_article_category>
<article class="preg">
<div class="grid_5"><txp:if_logged_in group="publisher"><p><a class="noprint" href="<txp:site_url />textpattern/index.php?event=article&amp;step=edit&amp;ID=<txp:article_id />"><txp:custom_field name="dates" escape="" /></a></p><txp:else /><p><txp:custom_field name="dates" escape="" /></p></txp:if_logged_in></div>
<div class="grid_6"><h6><a rel="follow" href="/<txp:section />/<txp:category1 />/"><txp:title /></a></h6></div>
<div class="grid_13"><txp:if_custom_field name="venues">
<p><txp:custom_field name="venue" escape="" /> <txp:custom_field name="venues" escape="" /></p>
<txp:else />
<p><txp:custom_field name="venue" escape="" /></p>
</txp:if_custom_field></div>
<div class="clear">&nbsp;</div></article>
<txp:else />
<article><div class="grid_5"><txp:if_logged_in group="publisher"><p><a class="noprint" href="<txp:site_url />textpattern/index.php?event=article&amp;step=edit&amp;ID=<txp:article_id />"><txp:custom_field name="dates" escape="" /></a></p><txp:else /><p><txp:custom_field name="dates" escape="" /></p></txp:if_logged_in></div>
<div class="grid_6"><h6><a href="<txp:permlink />" rel="bookmark"><txp:title /></a></h6></div>
<div class="grid_13"><txp:if_custom_field name="venues">
<p><txp:custom_field name="venue" escape="" /> <txp:custom_field name="venues" escape="" /></p>
<txp:else />
<p><txp:custom_field name="venue" escape="" /></p>
</txp:if_custom_field></div>
<div class="clear">&nbsp;</div></article>
</txp:if_article_category>
</txp:article_custom>
<p class="centre announce">Also see:<br />[&nbsp;<a href=/projects/hosted/>Hosted Projects</a>&nbsp;] [&nbsp;<a href=/projects/participations/>Participations in other projects</a>&nbsp;]</p><div class="clear">&nbsp;</div>
</main> 
</txp:if_category>
</txp:if_search>
</txp:if_section>

</txp:if_article_list>

<txp:hide>==================-individual articles-======================</txp:hide>

<txp:if_individual_article>

<txp:hide>==================-individual projects-======================</txp:hide>

<txp:article form="">
<figure itemscope itemtype="http://schema.org/ImageObject" class="grid_6 noprint nosmall">
<txp:images limit="1" sort="rand()" id='<txp:custom_field name="img2" />' break="">
<txp:thumbnail class="ds noprint" loading="lazy" /></txp:images></figure>
<figure itemscope itemtype="http://schema.org/ImageObject" class="grid_18 noprint"><txp:variable name="aimg" value='<txp:custom_field name="img_main" />' /><txp:if_variable name="aimg" value="">&nbsp;<txp:else /><txp:images id='<txp:variable name="aimg" />' sort="rand()" limit="8" wraptag="ul" break="li" class="rslides"><txp:image loading="lazy" /></txp:images></txp:if_variable></figure>
<div class="clear">&nbsp;</div>

<article class="grid_18" role="main" id="main">
<h1><txp:title /></h1>
<!--googleoff: all--><p class="printonly"><txp:site_url trim="/" /><txp:page_url /></p><!--googleon: all-->
<txp:body />
</article>

<div class="grid_6" id="side" role="complementary">
<div id="meta">
<txp:if_custom_field name="venues"><h5>Venues</h5>
<p><txp:custom_field name="venue" escape="" /> <txp:custom_field name="venues" /></p>
<txp:else />
<h5>Venue</h5>
<p><txp:custom_field name="venue" /></p>
</txp:if_custom_field>
<h5>Dates<txp:if_logged_in> <a class="noprint" href="<txp:site_url />textpattern/index.php?event=article&amp;step=edit&amp;ID=<txp:article_id />"><txp:article_id /></a></txp:if_logged_in></h5>
<p><txp:custom_field name="dates" escape="" /></p>
<p role="navigation" aria-label="breadcrumbs">&hellip; / <txp:section link="1" /> /
<txp:if_article_category number="1"><a href="/<txp:section />/<txp:category1 />/"><txp:category1 /></a> / </txp:if_article_category number="2"><txp:if_article_category number="2"><a href="/<txp:section />/<txp:category1 />/<txp:category2 />/"><txp:category2 /></a> / </txp:if_article_category></p>
</div>

<txp:output_form form="announce" />

<txp:output_form form="social_logos" />


<txp:variable name="publs" value='<txp:custom_field name="pubs_by_others" /><txp:custom_field name="pubs" /><txp:custom_field name="multi_event_pubs" />' />

<txp:if_variable name="publs" value="">
<txp:else />
<h4>Publications</h4>
</txp:if_variable>

<txp:if_custom_field name="multi_event_pubs">
<txp:images id='<txp:custom_field name="multi_event_pubs" />' break="">
<a href="<txp:site_url />publications/#book_<txp:image_info type="id" />"><txp:image loading="lazy" /></a>
</txp:images>
</txp:if_custom_field>

<txp:if_custom_field name="pubs">
<txp:images id='<txp:custom_field name="pubs" />' break="">
<a href="<txp:site_url />publications/#book_<txp:image_info type="id" />"><txp:image loading="lazy" /></a>
</txp:images>
</txp:if_custom_field>

<txp:if_custom_field name="pubs_by_others">
<txp:images id='<txp:custom_field name="pubs_by_others" />' break="">
<a href="<txp:site_url />publications/#book_<txp:image_info type="id" />"><txp:image loading="lazy" /></a>
</txp:images>
</txp:if_custom_field>

<txp:if_variable name="publs" value="">
<txp:else />
<div class="clear">&nbsp;</div></txp:if_variable>

<div class="sub">
<txp:output_form form="projects_side" />
</div>

</div>
<div class="clear">&nbsp;</div>
</txp:article>

<txp:hide>==================-end individual articles-======================</txp:hide>

</txp:if_individual_article>
<div class="clear">&nbsp;</div>

</div><!-- end .container_24 --></div>

<txp:if_article_list><txp:output_form form="YouTubeChannel" /></txp:if_article_list>
<div class="container_24">
<span class="grid_1 prefix_23 nosmall noprint"><a href="#front"><img class="margintop" src="<txp:page_url type="theme_path" />/forms/svg/top.svg" width="30" height="30" alt="back to top" /></a></span>
<div class="clear">&nbsp;</div>
</div>
<txp:output_form form="colak_foot" />
<txp:output_form form="cookies" />
<txp:output_form form="javascripts" />

</body>
</html>
