<txp:php>
if (isset($_POST['submit'])) {
$url = $_POST['site'].$_POST['terms'];
if ($_POST['section'] && ($_POST['section'] != 'null')) $url = $url.'&s='.$_POST['section'];
header('Location: '.$url);
} else {
header('content-type: text/html; charset=utf-8');
}
</txp:php>

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

<meta name="author" content="NeMe or other publishers" />
<meta name="Robots" content="index,follow" />
<meta name="revisit-after" content="10 days" />

<meta name="geo.region" content="CY" />
<meta name="geo.placename" content="Limassol" />
<meta name="DC.title" content="<txp:page_title />" />


<link rel="home" href="<txp:site_url />" />
<txp:if_search>
<link rel="canonical" href="<txp:site_url trim="/" /><txp:page_url escape="" />" />
<txp:else />
<txp:if_article_list>
<txp:if_category name="cited">
<link rel="canonical" href="<txp:site_url /><txp:section />/<txp:category />/" />
<txp:else />
<link rel="canonical" href="<txp:site_url /><txp:section />/" />
</txp:if_category>
<txp:else />
<link rel="canonical" href="<txp:permlink />" />
</txp:if_section>
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

<body id="<txp:section />" class="no-js">
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

<div class="clear">&nbsp;</div>

<txp:act_if_mobile>
</txp:else />
<aside class="share large nosmall noprint">
<a href="http://www.facebook.com/sharer/sharer.php?u=<txp:permlink />&amp;t=<txp:site_url trim="/" /><txp:page_url />" rel="nofollow" title="Share on Facebook"><img src="<txp:page_url type="theme_path" />/forms/svg/sm_facebook.svg" width="30" height="30" alt="share on facebook" /></a>
<a href="http://www.twitter.com/intent/tweet?url=<txp:site_url trim="/" /><txp:page_url />" rel="nofollow" title="Share on Twitter"><img src="<txp:page_url type="theme_path" />/forms/svg/sm_twitter.svg" width="30" height="30" alt="share on twitter"/></a>
<a href="http://www.reddit.com/submit?url=<txp:site_url trim="/" /><txp:page_url />" rel="nofollow" title="Share on Reddit"><img src="<txp:page_url type="theme_path" />/forms/svg/sm_redit.svg" width="30" height="30" alt="share on Redit"/></a>
</aside>
</txp:act_if_mobile>


<div id="content"><div class="container_24">

<txp:if_article_list>

<txp:hide>==================-citations-======================</txp:hide>


<txp:if_category name="cited">

<div class="line"><h4 class="grid_23 alpha" id="cited">NeMe citations</h4><div class="clear">&nbsp;</div></div>

<txp:images category="cite" breakby="2" break="<div class='clear'>&nbsp;</div>" limit="999" sort="alt desc">
<div class="grid_12 grideven"><figure itemscope itemtype="http://schema.org/ImageObject">
<span itemprop="image" class="grid_7 alpha"><img src="<txp:site_url />images/<txp:image_info type="id" />t<txp:image_info type="ext" />" alt="<txp:image_info type="alt" />" title="<txp:image_info type="alt" />" width="<txp:image_info type="thumb_w" />" height="<txp:image_info type="thumb_h" />" loading="lazy"/></span>
<figcaption itemprop="caption" class="grid_17 omega"><txp:image_info type="caption" escape="" />
<txp:if_logged_in group="publisher"><p class="noprint"><a href="/textpattern/index.php?event=image&amp;step=image_edit&amp;id=<txp:image_info type="id" />">edit</a></p></txp:if_logged_in>
</figcaption></figure>
<div class="clear">&nbsp;</div>
</div>
</txp:images>


<div class="clear">&nbsp;</div>

<div class="grid_8"><p>Did you write an article citing any of our books or content in this website?</p>
<p>Do send us the pdf, and the information we require, and we will be adding it to our list.</p></div>
<div class="grid_16">
<txp:com_connect to='<txp:authors name="colak"><txp:author_email /></txp:authors>' label="" thanks="thank you your submission will be reviewed shortly." subject="NeMe Citations">
 <txp:com_connect_text name="FirstName" label="Your Name:" required="1" class="grid_24" /><br />
 <txp:com_connect_text name="LastName" label="Your Surame:" required="1" class="grid_24" /><br />
 <txp:com_connect_email name="Email" label="Your Email:" required="1" class="grid_24" /><br />
 <txp:com_connect_text label="Your website:" required="0" class="grid_24" /><br />
 <txp:com_connect_text name="PublicationTitle" label="Publication Title:" required="1" class="grid_24" /><br />
 <txp:com_connect_text name="PublicationURL" label="Publication URL:" required="1" class="grid_24" /><br />
 <txp:com_connect_file label="Select file" max="8000000" accept=".pdf" required="1" /><br />
 <txp:com_connect_checkbox required="0" label="Check this box if you wish to subscribe to our newsletter." /><br />
 <txp:com_connect_checkbox label="This is not spam" /><br />
 <txp:com_connect_secret label="This article"><txp:site_url />publications/cited/</txp:com_connect_secret>
 <txp:com_connect_serverinfo name="REMOTE_ADDR" label="IP number" />
 <txp:com_connect_serverinfo name="HTTP_USER_AGENT" label="Browser" /><br />
 <txp:com_connect_submit label="Submit" />
 </txp:com_connect>
</div>

<div class="clear">&nbsp;</div>

<span class="grid_1 prefix_23 nosmall noprint"><a href="#landing"><img src="<txp:page_url type="theme_path" />/forms/svg/top.svg" width="30" height="30" alt="back to top" /></a></span>

<txp:else />
<txp:if_section name="publications">

<txp:hide>==================-publications-======================</txp:hide>

<div class="line"><h4 class="grid_23 alpha" id="nemepubs">NeMe publications</h4><div class="clear">&nbsp;</div></div>

<txp:article_custom section="projects,about" limit="999">
<txp:if_custom_field name="pubs">
<txp:images id='<txp:custom_field name="pubs" />' break="">
<div class="line"><figure itemscope itemtype="http://schema.org/ImageObject"><span itemprop="image" class="grid_6"><txp:permlink><img src="<txp:site_url />images/<txp:image_info type="id" /><txp:image_info type="ext" />" width="<txp:image_info type="w" />" height="<txp:image_info type="h" />" title="<txp:image_info type="alt" />" alt="<txp:image_info type="alt" />" id="book_<txp:image_info type="id" />" loading="lazy" /></txp:permlink></span><figcaption itemprop="caption" class="grid_17"><txp:image_info type="caption" escape="" />
<txp:if_logged_in group="publisher"><p class="noprint"><a href="/textpattern/index.php?event=image&amp;step=image_edit&amp;id=<txp:image_info type="id" />">edit</a></p></txp:if_logged_in></figcaption></figure><div class="clear">&nbsp;</div></div>
</txp:images>
</txp:if_custom_field>
</txp:article_custom> 

<div class="line"><h4 class="grid_23 alpha" id="other">Beside the articles appearing in numerous newspapers, magazines and websites showcasing our activities, NeMe is mentioned or acknowledged in&#8230;</h4><a class="nosmall noprint" href="#landing"><img src="<txp:page_url type="theme_path" />/forms/svg/top.svg" width="30" height="30" alt="back to top" /></a><div class="clear">&nbsp;</div></div>

<txp:variable name="otherpubs" value='<txp:article_custom section="projects,about" limit="999" break=","><txp:if_custom_field name="pubs_by_others"><txp:custom_field name="pubs_by_others" /></txp:if_custom_field></txp:article_custom>' />
<txp:images id='<txp:variable name="otherpubs" />' sort="alt desc" limit="999" break="">
<txp:if_different>
<div class="line"><figure itemscope itemtype="http://schema.org/ImageObject"><span itemprop="image" class="grid_6">
<a href="<txp:site_url /><txp:image_info type="name" />"><img src="<txp:site_url />images/<txp:image_info type="id" /><txp:image_info type="ext" />" alt="<txp:image_info type="alt" />" title="<txp:image_info type="alt" />" width="<txp:image_info type="w" />" height="<txp:image_info type="h" />" id="book_<txp:image_info type="id" />" loading="lazy" /></a></span>
<figcaption itemprop="caption" class="grid_17"><txp:image_info type="caption" escape="" /><txp:if_logged_in><p><a href="/textpattern/index.php?event=image&amp;step=image_edit&amp;id=<txp:image_info type="id" />">edit</a></p></txp:if_logged_in></figcaption></figure>
<div class="clear">&nbsp;</div>
</div>
</txp:if_different>
</txp:images>
<div class="line"><h4 class="grid_23 alpha" id="cited"><a href="/publications/cited/">Publications citing our content</a></h4><a class="nosmall noprint" href="#landing"><img src="<txp:page_url type="theme_path" />/forms/svg/top.svg" width="30" height="30" alt="back to top" /></a><div class="clear">&nbsp;</div></div>
</txp:if_section>
</txp:if_category>
<div class="clear">&nbsp;</div>

</div><!-- end .container_24 --></div>

</txp:if_article_list>

<txp:output_form form="colak_foot" />
<txp:output_form form="cookies" />
<txp:output_form form="javascripts" />

</body>
</html>
