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


<txp:if_section name="contact,newsletter">
<meta name="Robots" content="noindex,follow" />
<txp:else />
<meta name="author" content="NeMe" />
<meta name="Robots" content="index,follow" />
<meta name="revisit-after" content="10 days" />
</txp:if_section>

<meta name="geo.region" content="CY" />
<meta name="geo.placename" content="Limassol" />
<meta name="DC.title" content="<txp:page_title />" />


<link rel="home" href="<txp:site_url />" />
<txp:if_search>
<link rel="canonical" href="<txp:site_url trim="/" /><txp:page_url escape="" />" />
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
<meta property="og:image" content="h<txp:site_url />images/1087.jpg" />
<meta property="og:image:width" content="1200" />
<meta property="og:image:height" content="400" />
<meta property="og:image:alt" content="NeMe logo" />
<meta name="twitter:card" content="summary" />
<meta name="twitter:site" content="@nemeorg" />
<meta name="twitter:creator" content="@nemeorg" />
<meta name="twitter:url" content="<txp:site_url /><txp:page_url />" />
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
<li><a href="#menu">go to menu</a></li>
<li><a href="#content">go to content</a></li>
<li><a href="#footer">go to search</a></li>
</ul>
</div>

<txp:hide>==================-menu-======================</txp:hide>

<img src="<txp:page_url type="theme_path" />/forms/svg/neme_white.svg" alt="NeMe logo" class="logo" width="50" height="50" />

<txp:output_form form="colak_menu" />

<txp:hide>==================-social-======================</txp:hide>

<txp:act_if_mobile>
<txp:else />
<div class="share large nosmall noprint">
<a href="http://www.facebook.com/sharer/sharer.php?u=<txp:permlink />&amp;t=<txp:site_url trim="/" /><txp:page_url />" rel="nofollow" title="Share on Facebook"><img src="<txp:page_url type="theme_path" />/forms/svg/sm_facebook.svg" width="30" height="30" alt="share on facebook" /></a>
<a href="http://www.twitter.com/intent/tweet?url=<txp:site_url trim="/" /><txp:page_url />" rel="nofollow" title="Share on Twitter"><img src="<txp:page_url type="theme_path" />/forms/svg/sm_twitter.svg" width="30" height="30" alt="share on twitter"/></a>
<a href="http://www.reddit.com/submit?url=<txp:site_url trim="/" /><txp:page_url />" rel="nofollow" title="Share on Reddit"><img src="<txp:page_url type="theme_path" />/forms/svg/sm_redit.svg" width="30" height="30" alt="share on Redit"/></a>
</div>
</txp:act_if_mobile>

<div id="content"><div class="container_24">

<txp:hide>==================-article-lists-======================</txp:hide>

<txp:if_article_list>

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
<txp:linklist category="contributors" limit="999999" sort="linksort" break=" &bull; " wraptag="p"> <txp:variable name="haslink" value='<txp:link_url />' /> <txp:if_variable name="haslink" value="#"> <txp:link_name escape="" /> <txp:else /> <a href="<txp:link_url />" rel="external noopener"><txp:link_name escape="html" /></a> </txp:if_variable> </txp:linklist>

<div class="clear">&nbsp;</div>

<hr />

<div class="announce"><h4>Sponsors</h4>
<p>NeMe seeks, accepts and welcomes sponsorship for its events. To date, these the organisations helpped our projects in either a financial or in-kind way.</p>

<txp:linklist category="sponsors" limit="999999" sort="linkname" break=" &bull; " wraptag="p">
<txp:variable name="haslink" value='<txp:link_url />' />
<txp:if_variable name="haslink" value="#">
<txp:link_name escape="html" />
<txp:else />
<a href="<txp:link_url />" rel="external noopener"><txp:link_name escape="html" /></a>
</txp:if_variable>
</txp:linklist></div>

<hr />

<h4>Venues</h4>

<txp:linklist category="venues,venues-featured" limit="999999" sort="linkname" break=" &bull; " wraptag="p">
<txp:variable name="haslink" value='<txp:link_url />' />
<txp:if_variable name="haslink" value="#">
<txp:link_name escape="html" />
<txp:else />
<a href="<txp:link_url />" rel="external noopener"><txp:link_name escape="html" /></a>
</txp:if_variable>
</txp:linklist>


<div class="clear">&nbsp;</div>

<hr />

<div class="announce"><h5 id="site_thanks">For their help and/or advice for the coding of our websites we thank:</h5>

<txp:output_form form="site_thanks" /></div>

</div>

<div class="clear">&nbsp;</div>

</txp:if_section>


</txp:if_article_list>

<txp:hide>==================-individual articles-======================</txp:hide>

<txp:if_individual_article>
</txp:if_individual_article>


<div class="clear">&nbsp;</div>

<!-- ====================================== -->

<div id="social" class="nosmall"><div class="container_24">
<txp:oui_cookie name="accept_fb_cookies" duration="+1 year" values="yes" />
<txp:oui_if_cookie name="accept_fb_cookies">
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.12';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<div class="grid_12 socialfeed"><div class="fb-page" data-href="https://www.facebook.com/NeMeArtsCentre/" data-tabs="timeline" data-width="450" data-height="500" data-small-header="true" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="false"><blockquote cite="https://www.facebook.com/NeMeArtsCentre/" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/NeMeArtsCentre/">NeMe</a></blockquote></div>
</div>
<txp:else />
<div class="grid_12 socialeucookies"><p class="centre">This is the space we embed our <a rel="external noopener" href="https://www.facebook.com/NeMeArtsCentre/">Facebook feed</a>. By viewing it here you agree with Facebook's <a rel="external noopener" href="https://facebook.com/about/privacy/">Privacy Policy</a>.</p><p class="centre"><a class="red" rel="nofollow" href="?accept_fb_cookies=yes">View Facebook feed</a></p><div class="clear">&nbsp;</div></div>
</txp:oui_if_cookie>

<txp:oui_cookie name="accept_twitter_cookies" duration="+1 year" values="yes" />
<txp:oui_if_cookie name="accept_twitter_cookies">
<div class="grid_12 socialfeed"><a class="twitter-timeline" data-lang="en" data-width="470" data-height="500" data-link-color="#cc0000" href="https://twitter.com/NeMeOrg?ref_src=twsrc%5Etfw">Tweets by NeMeOrg</a> <script async src="https://platform.twitter.com/widgets.js"></script></div><div class="clear">&nbsp;</div>
</div>
<txp:else />
<div class="grid_12 socialeucookies"><p class="centre">This is the space we embed our <a rel="external noopener" href="https://twitter.com/NeMeOrg">Twitter feed</a>. By viewing it here, you agree with Twitter's <a rel="external noopener" href="https://twitter.com/privacy?lang=en">Privacy Policy</a>.</p><p class="centre" style="margin-bottom:1em;"><a class="red" rel="nofollow" href="?accept_twitter_cookies=yes">View Twitter feed</a></p><div class="clear">&nbsp;</div></div>
</txp:oui_if_cookie>

<div class="clear">&nbsp;</div></div></div>

<!-- ========================================= -->

<span class="grid_1 prefix_23 nosmall noprint"><a href="#landing"><img src="<txp:page_url type="theme_path" />/forms/svg/top.svg" width="30" height="30" alt="back to top" /></a></span>
<div class="clear">&nbsp;</div>

</div><!-- end .container_24 --></div>
<txp:output_form form="colak_foot" />
<txp:output_form form="cookies" />
<txp:output_form form="javascripts" />

</body>
</html>
