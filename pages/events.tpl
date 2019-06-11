<txp:php>
if (isset($_POST['submit'])) {
$url = $_POST['site'].$_POST['terms'];
if ($_POST['section'] && ($_POST['section'] != 'null')) $url = $url.'&s='.$_POST['section'];
header('Location: '.$url);
} else {
header('content-type: text/html; charset=utf-8');
}
</txp:php>

<txp:if_logged_in not><txp:pat_speeder gzip="0"/></txp:if_logged_in>
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
<txp:act_if_mobile><meta http-equiv="x-rim-auto-match" content="none" /></txp:act_if_mobile>
<meta name="apple-mobile-web-app-capable" content="yes">

<txp:css name="default" format="flat.link" media="all" />
<txp:if_article_list><txp:css name="articlelists" format="flat.link" media="all" /></txp:if_article_list>
<!--[if IE]><txp:css name="ie-fluid" format="flat.link" /><![endif]-->
<!--[if IE 7]><txp:css name="ie7" format="flat.link" /><![endif]-->
<!--[if gte IE 9]<style type="text/css">nav li {filter: none;}</style><![endif]-->
<txp:act_if_mobile><txp:css name="mobile" format="flat.link" media="screen" /></txp:act_if_mobile>
<txp:css name="print" format="flat.link" media="print" />


<txp:if_section name="contact,newsletter">
<meta name="Robots" content="noindex,follow" />
<txp:else />
<meta name="author" content="NeMe and contributors" />
<meta name="Robots" content="index,follow" />
<meta name="revisit-after" content="10 days" />
</txp:if_section>

<meta name="geo.region" content="CY" />
<meta name="geo.placename" content="Limassol" />
<meta name="DC.title" content="<txp:page_title />" />


<link rel="home" href="<txp:site_url />" />
<txp:if_search>
<link rel="canonical" href="<txp:site_url /><txp:page_url />" />
<txp:else />
<txp:if_article_list>
<txp:if_section name="">
<link rel="canonical" href="<txp:site_url />" />
<txp:else />
<link rel="canonical" href="<txp:site_url /><txp:section />/" />
</txp:if_section>
<txp:else />
<link rel="canonical" href="<txp:permlink />" />
</txp:if_article_list>
</txp:if_search>

<txp:if_description><txp:meta_description /></txp:if_description>

<meta property="og:site_name" content="<txp:site_name />" />
<meta property="og:type" content="website" />
<meta property="og:title" content="<txp:page_title />" />
<txp:if_description><meta property="og:description" content="<txp:meta_description format="" />" /></txp:if_description>
<meta property="og:url" content="<txp:site_url /><txp:page_url />" />

<txp:if_individual_article>
<meta name="twitter:card" content="summary" />
<meta name="twitter:site" content="@nemeorg" />
<meta name="twitter:creator" content="@nemeorg" />
<meta name="twitter:url" content="<txp:permlink />" />
<meta name="twitter:title" content="<txp:page_title />" />
<meta name="twitter:description" content="<txp:if_description><txp:meta_description format="" /><txp:else /><txp:smd_wrap_all transform="strip_tags"><txp:excerpt /></txp:smd_wrap_all></txp:if_description>" />
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
<li><a title="NeMe Arts Centre" href="<txp:site_url />nac/"<txp:if_section name="nac"> class="active"</txp:if_section> rel="bookmark">NAC</a></li>
<li><a href="<txp:site_url />events/"<txp:if_section name="events"> class="active"</txp:if_section> rel="section">Events</a></li>
<li><a href="<txp:site_url />participations/"<txp:if_section name="participations"> class="active"</txp:if_section> rel="section">Participations</a></li>
<li><a href="<txp:site_url />publications/"<txp:if_section name="publications"> class="active"</txp:if_section> rel="bookmark">Publications</a></li>
<li><a href="<txp:site_url />workshops/"<txp:if_section name="workshops"> class="active"</txp:if_section> rel="bookmark">Workshops</a></li>
<li><a href="<txp:site_url />texts/"<txp:if_section name="texts"> class="active"</txp:if_section> rel="section">Texts</a></li>
<li><a href="<txp:site_url />blog/"<txp:if_section name="blog"> class="active"</txp:if_section>>Blog</a></li>
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
<txp:hide>jpg logo<txp:image id="792" /></txp:hide>
<txp:if_section name="">
<img src="/themes/neme960/forms/svg/neme.svg" alt="NeMe logo" width="70" height="70" />
<txp:else />
<a href="<txp:site_url />" rel="home"><img src="/themes/neme960/forms/svg/neme.svg" alt="NeMe logo" width="70" height="70" /></a>
<small>Est. 2004</small>
</txp:if_section>
</div>

<h1><txp:page_title /></h1>
<!--googleoff: all--><p class="printonly">www.neme.org<txp:page_url /></p><!--googleon: all-->
<div class="clear">&nbsp;</div>

</div><!-- end .container_24 --></div>
<div class="share large nosmall noprint">
<a href="http://www.facebook.com/sharer/sharer.php?u=<txp:permlink />&amp;t=http://www.neme.org<txp:page_url />" rel="nofollow" title="Share on Facebook"><img src="/themes/neme960/forms/svg/sm_facebook.svg" width="30" height="30" alt="share on facebook" /></a>
<a href="http://www.twitter.com/intent/tweet?url=http://www.neme.org<txp:page_url />" rel="nofollow" title="Share on Twitter"><img src="/themes/neme960/forms/svg/sm_twitter.svg" width="30" height="30" alt="share on twitter"/></a>
<a href="http://www.reddit.com/submit?url=http://www.neme.org<txp:page_url />" rel="nofollow" title="Share on Reddit"><img src="/themes/neme960/forms/svg/sm_redit.svg" width="30" height="30" alt="share on Redit"/></a>
</div>
<div id="content"><div class="container_24">

<txp:hide>==================-article-lists-======================</txp:hide>

<txp:if_article_list>

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
<div class="line noprint">


<figure itemscope itemtype="http://schema.org/ImageObject" class="grid_6 nosmall noprint"><txp:images category='<txp:category_list type="image" parent=''<txp:section />'' break=","><txp:category type="image" /></txp:category_list>' sort="rand()" limit="1"><txp:thumbnail class="ds noprint" /></txp:images></figure>

<figure itemscope itemtype="http://schema.org/ImageObject" class=" grid_18 noprint"><txp:images category='<txp:category_list type="image" parent=''<txp:section />'' break=","><txp:category type="image" /></txp:category_list>' sort="rand()" limit="6" wraptag="ul" break="li" class="rslides"><txp:image /></txp:images></figure>


<div class="clear">&nbsp;</div></div>

<section><div class="line nosmall">
<div class="grid_5 nosmall"><p>Dates</p></div>
<div class="grid_6 nosmall"><p>Title</p></div>
<div class="grid_13 nosmall"><p>Venue</p></div>
<div class="clear nosmall noprint">&nbsp;</div></div>

<txp:article limit="999">
<article><div class="grid_5"><txp:if_logged_in><p><a href="<txp:site_url />textpattern/index.php?event=article&amp;step=edit&amp;ID=<txp:article_id />"><txp:custom_field name="dates" escape="" /></a></p><txp:else /><p><txp:custom_field name="dates" escape="" /></p></txp:if_logged_in></div>
<div class="grid_6"><h6><a href="<txp:permlink />" rel="bookmark"><txp:title /></a></h6></div>
<div class="grid_13"><txp:if_custom_field name="venues">
<p><txp:custom_field name="venue" escape="" /> <txp:custom_field name="venues" escape="" /></p>
<txp:else />
<p><txp:custom_field name="venue" escape="" /></p>
</txp:if_custom_field></div>
<div class="clearboth"><hr class="noprint" /></div></article>
</txp:article></section>
</txp:if_search>
</txp:if_section>

</txp:if_article_list>

<txp:hide>==================-individual articles-======================</txp:hide>

<txp:if_individual_article>

<txp:hide>==================-individual events-participations-======================</txp:hide>

<txp:if_article_section name="events,participations">
<txp:article form=""><figure itemscope itemtype="http://schema.org/ImageObject" class="grid_6 noprint nosmall">
<txp:images limit="1" sort="rand()" id='<txp:custom_field name="img2" />' break="">
<txp:thumbnail class="ds noprint" /></txp:images></figure>
<figure itemscope itemtype="http://schema.org/ImageObject" class="grid_18 noprint"><txp:variable name="aimg" value='<txp:custom_field name="img_main" />' /><txp:if_variable name="aimg" value="">&nbsp;<txp:else /><txp:images id='<txp:variable name="aimg" />' sort="rand()" limit="6" wraptag="ul" break="li" class="rslides"><txp:image /></txp:images></txp:if_variable></figure>
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

<h3>Announcements</h3>
<div class="announce">
<txp:output_form form="announce" />
</div>
<txp:output_form form="social_logos" />


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

<txp:hide>==================-end individual articles-======================</txp:hide>

</txp:if_individual_article>
<div class="clear">&nbsp;</div>
<span class="grid_1 prefix_23 nosmall"><a href="#landing"><img src="/themes/neme960/forms/svg/top.svg" width="30" height="30" alt="back to top" /></a></span>
<div class="clear">&nbsp;</div>

</div><!-- end .container_24 --></div>
<txp:output_form form="colak_foot" />

<txp:output_form form="javascripts" />
<txp:oui_cookie name="accept_cookies" duration="+1 year" values="yes" />
<!--googleoff: all-->
<txp:oui_if_cookie name="accept_cookies">
<txp:output_form form="cookies" />
<txp:else />
<div id="eucookies" class="noprint cookies"><div class="container_24 noprint">
<div class="grid_18 noprint"><h3>We value your privacy</h3>
<p>To make sure that this website remains accessible in the European Union, we are forced to include this annoying notice so as to inform you that this website, like most of the websites in the world, works best with <a rel="nofollow" href="/about/cookies">cookies</a>. We do not profile you or use the data for any commercial purposes except to study ways to enhance user experience in ours sites. We hope that you are happy with that, and that you will help us continue this research by <a rel="nofollow" href="?accept_cookies=yes">accepting our cookies</a> but, unlike with other websites,  surfing our site in privacy is still possible should you decide not to. You can find out more about our use of cookies by reading our <a rel="nofollow" href="http://www.neme.org/about/privacy-policy">privacy policy</a>.</p></div>
<p class="grid_6 noprint"><a rel="nofollow" href="?accept_cookies=yes">Accept</a></p>

</div><div class="clear">&nbsp;</div></div>
</txp:oui_if_cookie>
<!--googleon: all-->

</body>
</html>
