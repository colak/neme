<txp:php>
if (isset($_POST['submit'])) {
$url = $_POST['site'].$_POST['terms'];
if ($_POST['section'] && ($_POST['section'] != 'null')) $url = $url.'&s='.$_POST['section'];
header('Location: '.$url);
} else {
header('content-type: text/html; charset=utf-8');
}
</txp:php>

<txp:if_logged_in group="publisher" not><txp:pat_speeder group="publisher" gzip="0"/></txp:if_logged_in>
<txp:hide><txp:evaluate query='"<txp:site_url trim="/" /><txp:page_url type="req" />" != "<txp:page_url context="id, s, c, context, q, m, month, author, commented, pg, accept_vimeo_cookies" />"'>
    <txp:txp_die status="404" />
</txp:evaluate></txp:hide>
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


<txp:css name="default" media="all" format="flat.link" />
<txp:if_article_list><txp:css name="articlelists" media="all" format="flat.link" /></txp:if_article_list>
<!--[if IE]><txp:css name="ie-fluid" media="all" format="flat.link" /><![endif]-->
<!--[if IE 7]><txp:css name="ie7" format="flat.link" /><![endif]-->
<!--[if gte IE 9]<style type="text/css">nav li {filter: none;}</style><![endif]-->
<txp:act_if_mobile><txp:css name="mobile" media="all" format="flat.link" /></txp:act_if_mobile>
<txp:css name="print" format="flat.link" media="print" />

<meta name="author" content="NeMe and contributors" />
<txp:evaluate query='contains("<txp:page_url />","?accept_")'>
<meta name="Robots" content="noindex,nofollow" />
<txp:else />
<meta name="Robots" content="index,follow" />
</txp:evaluate>
<meta name="revisit-after" content="10 days" />

<meta name="author" content="NeMe" />
<meta name="geo.region" content="CY" />
<meta name="geo.placename" content="Limassol" />
<meta name="DC.title" content="<txp:page_title />" />


<link rel="home" href="<txp:site_url />" />
<txp:if_search>
<link rel="canonical" href="<txp:site_url trim="/" /><txp:page_url escape="" />" />
<txp:else />
<txp:if_article_list>
<txp:evaluate query='contains("<txp:page_url />","?accept_")'>
<txp:else />
<link rel="canonical" href="<txp:site_url trim="/" /><txp:page_url />" />
</txp:evaluate>
<txp:else />
<txp:evaluate query='contains("<txp:page_url />","?accept_")'>
<txp:else />
<link rel="canonical" href="<txp:permlink />" />
</txp:evaluate>
</txp:if_article_list>
</txp:if_search>
<txp:older wraptag='<link rel="prev" href="<+>" />' />
<txp:newer wraptag='<link rel="next" href="<+>" />' />

<txp:if_description><txp:meta_description /></txp:if_description>

<meta property="og:site_name" content="<txp:site_name />" />
<meta property="og:type" content="website" />
<meta property="og:title" content="<txp:page_title />" />
<txp:if_description><meta property="og:description" content="<txp:meta_description format="" />" /></txp:if_description>
<meta property="og:url" content="<txp:site_url trim="/" /><txp:page_url escape="" />" />

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

<txp:hide>==================-article_list-======================</txp:hide>

<txp:if_search>
<txp:if_search_results>
<h3>You searched for <strong><txp:page_url type="q" /></strong>. <txp:search_result_count />.</h3>
<txp:article limit="900" />
<hr />
<txp:else />
<p>Your search for <strong><txp:page_url type="q" /></strong> did not match any documents.</p>
<h3>Suggestions:</h3>
<ul><li>Make sure all words are spelled correctly.</li>
<li>Try fewer keywords</li>
<li>Try different keywords</li></ul>
</txp:if_search_results>
<txp:article limit="10" searchall="1" />
<txp:else />
<main aria-label="main content" itemscope itemtype="https://schema.org/CollectionPage">
<txp:evaluate query='<txp:page_url type="pg" /> = 1'>
<txp:article_custom status="live" section="blog" c10="x" form="sticky_form" limit="30" />
</txp:evaluate>
<txp:article limit="10" c10="" listform="live_form" form="" />
</main>

<div class="clear">&nbsp;</div>
<txp:evaluate test="3,7,5">
<nav aria-label="page nav" class="pagination">
<ul>
<txp:newer showalways break="li"><span aria-label="Go to previous page">&#x2962;</span></txp:newer>
<txp:newer shift break="li"><span aria-label="Go to first page"><txp:yield item="page" /></span></txp:newer>
<txp:newer shift="5-3" limit="1" break="li"><span role="separator" aria-label="More pages">&hellip;</span></txp:newer>
<txp:newer total shift="2" break="li"><span aria-label="Go to page <txp:yield item="page" />"><txp:yield item="page" /></span></txp:newer>
<txp:pages shift="0" break="li"><span aria-label="You are on page <txp:yield item="page" />"><txp:yield item="page" /></span></txp:pages>
<txp:older total shift="2" break="li"><span aria-label="Go to page <txp:yield item="page" />"><txp:yield item="page" /></span></txp:older>
<txp:older shift="5-3" limit="1" break="li"><span role="separator" aria-label="More pages">&hellip;</span></txp:older>
<txp:older shift break="li"><span aria-label="Go to last page"><txp:yield item="page" /></span></txp:older>
<txp:older showalways break="li"><span aria-label="Go to next page">&#x2964;</span></txp:older>
</ul>
</nav>
</txp:evaluate>


</txp:if_search>
</txp:if_article_list>

<txp:hide>==================-individual blog-======================</txp:hide>

<txp:if_individual_article>

<txp:article status="live" form="">
<div class="grid_18" id="main">
<main aria-label="main content" itemscope itemtype="https://schema.org/Blog">
<txp:if_custom_field name="img2"><txp:image id='<txp:custom_field name="img2" />' class="grid_8" /><txp:else />
<txp:if_custom_field name="img_main"><txp:image id='<txp:custom_field name="img_main" />' class="grid_24 alpha omega round" /><div class="clear">&nbsp;</div></txp:if_custom_field>
</txp:if_custom_field>

<article>
<txp:if_request type="get" name="redirected">
<div class="grid_24 alpha omega"><strong class="announce">Please note that you have arrived here via an outdated URL. Please update your bookmark. The new URL for this article is: <a href="<txp:permlink />" rel="canonical"><txp:permlink /></a>.</strong></div><div class="clear">&nbsp;</div>
</txp:if_request>

<h1><txp:title /></h1>
<!--googleoff: all--><p class="printonly"><txp:site_url trim="/" /><txp:page_url /></p><!--googleon: all-->
<txp:body /></article>
</txp:article>
</main>
<txp:article status="live" c10="">
<div class="clear">&nbsp;</div>
<nav class="paginator" aria-label="page_nav">
<txp:variable name="prev1" value='<txp:link_to_prev />' />
<txp:if_variable name="prev1" value="">
<div class="prev">&nbsp;</div>
<txp:else />
<div class="prev noprint"><txp:link_to_prev>&#8666; <txp:title /></txp:link_to_prev></div>
</txp:if_variable>
<txp:variable name="next1" value='<txp:link_to_next />' />
<txp:if_variable name="next1" value="">
<div class="prev noprint">&nbsp;</div>
<txp:else />
<div class="next aright noprint"><txp:link_to_next><txp:title /> &#8667;</txp:link_to_next></div>
</txp:if_variable>
</nav>
</txp:article>
<div class="clear">&nbsp;</div>

</div>
<txp:article form="">
<div class="grid_6" id="side" role="complementary">
<div id="meta">
<txp:if_custom_field name="venue">
<txp:if_custom_field name="venue" value="#">
<h4>Off line</h4>
<txp:else />
<p><a rel="external" href="<txp:custom_field name="venue" escape="" />">Website</a></p>
</txp:if_custom_field>
<txp:else />
<p><a href="<txp:site_url />" rel="home">NeMe project</a></p>
</txp:if_custom_field>

<txp:if_custom_field name="type" value="call"><h3>Deadline</h3><txp:custom_field name="Dates" /></txp:if_custom_field>
<txp:if_custom_field name="Dates">
<txp:if_custom_field name="type" value="info"><h5>Date(s)</h5><txp:custom_field name="Dates" /></txp:if_custom_field>
<txp:else />
</txp:if_custom_field>
<h5>Posted<txp:if_logged_in> <a class="noprint" href="<txp:site_url type="admin" />index.php?event=article&amp;step=edit&amp;ID=<txp:article_id />"><txp:article_id /></a></txp:if_logged_in></h5>
<time datetime="<txp:posted format="iso8601" />">
<txp:posted class="time-day" wraptag="span" format="%d" /> <txp:posted class="time-month" wraptag="span" format="%B" /> <txp:posted class="time-year" wraptag="span" format="%Y" />, <txp:posted class="time-time" wraptag="span" format="%T" />
</time>
</div>
</txp:article>

<txp:output_form form="announce" />

<txp:output_form form="social_logos" />

<div class="sub">
<h3>Latest Blog posts</h3>
<txp:article_custom section="blog" c10="" sort="posted desc" exclude='<txp:article_id />' limit="10" status="live" break="li" wraptag="ul" class="submenu">
<txp:permlink><txp:title /></txp:permlink>
</txp:article_custom>
</div></div>


<txp:hide>==================-end individual articles-======================</txp:hide>

</txp:if_individual_article>
<div class="clear">&nbsp;</div>
<div class="grid_23 nosmall">&nbsp;</div>
<div class="grid_1 nosmall noprint"><a href="#<txp:section />"><img class="margintop" src="<txp:page_url type="theme_path" />/forms/svg/top.svg" width="30" height="30" alt="back to top" /></a></div>
<div class="clear">&nbsp;</div>
</div>
</div><!-- end .container_24 -->

<txp:output_form form="colak_foot" />
<txp:output_form form="cookies" />

</body>
</html>
