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
<meta name="apple-mobile-web-app-capable" content="yes">


<txp:if_article_list>
<link rel="stylesheet" media="all" href="<txp:css name="articlelists_2026v2" format="flat.url" />">
<txp:else />
<link rel="stylesheet" media="all" href="<txp:css name="default_2026" format="flat.url" />">
</txp:if_article_list>
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

<txp:output_form form="colak_menu_2026" />
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
<main>
<article class="grid_22 prefix_1 suffix_1">
<h1><txp:if_logged_in not><txp:title /><txp:else /><a href="/textpattern/index.php?event=article&step=edit&ID=2373"><txp:title /></a></txp:if_logged_in></h1>
<txp:body />
</article>
</main>
</txp:article_custom>

<div class="clear">&nbsp;</div>

<div class="g_12 preg"><h4 class="centre h5" style="padding:.5rem 0;"><a href="/publications/participations/">Contributions</a></h4></div><div class="g_12 preg"><h4 class="centre h5" style="padding:.5rem 0;"><a href="/publications/mentioned/">Mentions</a></h4></div><div class="clearboth">&nbsp;</div>
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
<main>
<article class="grid_22 prefix_1 suffix_1">
<h1><txp:if_logged_in not><txp:title /><txp:else /><a href="/textpattern/index.php?event=article&step=edit&ID=2375"><txp:title /></a></txp:if_logged_in></h1>
<txp:body />
</article>
</main>
</txp:article_custom>

<div class="clear">&nbsp;</div>

<div class="g_12 preg"><h2 class="h5 centre" style="padding:.5rem 0;"><a href="/publications/participations/">Contributions</a></h2></div><div class="g_12 preg"><h2 class="h5 centre" style="padding:.5rem 0;"><a href="/publications/cited/">Citations</a></h2></div><div class="clearboth">&nbsp;</div>

<div class="clear">&nbsp;</div>

<txp:else />

<txp:hide>==================-Participations-======================</txp:hide>

<txp:if_category name="participations">

<main>
<div class="line grid_24"><h1 class="h4" id="contributed">Contributions to publications</h1></div>

<txp:article_custom section="publications" category="participations" limit="999" breakby="4" break='<div class="clearboth nosmall">&nbsp;</div>'><figure class="grid_6" id="book_<txp:custom_field name="article_image" />"><txp:permlink><txp:article_image loading="lazy" /></txp:permlink><figcaption class=""><h2 class="h6"><txp:permlink><txp:title /></txp:permlink></h2></figcaption></figure>
</txp:article_custom>

</main>

<div class="clearboth">&nbsp;</div>
<div class="g_12 preg"><h4 class="centre h5" style="padding:.5rem 0;"><a href="/publications/mentioned/">Mentions</a></h4></div><div class="g_12 preg"><h4 class="centre h5" style="padding:.5rem 0;"><a href="/publications/cited/">Citations</a></h4></div><div class="clearboth">&nbsp;</div>

<txp:else />


<txp:hide>==================-publications-======================</txp:hide>

<txp:if_section name="publications">

<div class="line"><h1 class="grid_23 alpha h4" id="nemepubs"><txp:if_logged_in not>NeMe publications<txp:else /><a href="/textpattern/index.php?event=page&name=publications">Publications</a></txp:if_logged_in></h1><div class="clear">&nbsp;</div></div>
<div class="grid_24 line"><h2 class="h4">Published or co-published</h2></div>


<txp:article_custom section="publications" exclude="category1" limit="999" breakby="4" break='<div class="clearboth nosmall">&nbsp;</div>'><figure id="book_<txp:custom_field name="article_image" />" class="grid_6"><txp:permlink><txp:article_image loading="lazy" /></txp:permlink><figcaption class=""><h2 class="h6"><txp:permlink><txp:title /></txp:permlink></h2></figcaption></figure></txp:article_custom>
<div class="clear">&nbsp;</div>
<div class="line">&nbsp;</div>



<div class="line grid_24"><h2 class="h4" id="contributed">Contributions to publications</h2></div>

<txp:article_custom section="publications" category="participations" limit="999" breakby="4" break='<div class="clearboth nosmall">&nbsp;</div>'><figure id="book_<txp:custom_field name="article_image" />" class="grid_6"><txp:permlink><txp:article_image loading="lazy" /></txp:permlink><figcaption class=""><h3 class="h6"><txp:permlink><txp:title /></txp:permlink></h3></figcaption></figure>
</txp:article_custom>
<div class="clearboth">&nbsp;</div>
<div class="clear">&nbsp;</div>

<div class="g_12 preg"><h4 class="centre h5" style="padding:.5rem 0;"><a href="/publications/mentioned/">Mentions</a></h4></div><div class="g_12 preg"><h4 class="centre h5" style="padding:.5rem 0;"><a href="/publications/cited/">Citations</a></h4></div><div class="clearboth">&nbsp;</div>
</txp:if_section>
</txp:if_category>
</txp:if_category>
</txp:if_category>
<div class="clear">&nbsp;</div>
</txp:article>
</txp:if_article_list>


<txp:hide>==================-Individual articles-======================</txp:hide>

<txp:if_individual_article>
<txp:article form="" listform="">
<article class="grid_18" role="main" itemscope itemtype="http://schema.org/Text">
<h1><txp:title /></h1>
<p class="printonly"><txp:site_url trim="/" /><txp:page_url /></p>
<txp:body />
</article>
</txp:article>

<div class="grid_6" id="side" role="complementary">

<div itemscope itemtype="http://schema.org/Person" id="meta">
<time class="published" datetime="<txp:posted format="%Y-%m-%d" />">
Posted: <txp:posted format="%b %d, %Y" /></time> 
<txp:if_logged_in>(<a class="noprint" href="<txp:site_url />textpattern/index.php?event=article&amp;step=edit&amp;ID=<txp:article_id />"><txp:article_id /></a>)</txp:if_logged_in>
</div>

<txp:output_form form="announce" />

<div class="sub">

<txp:if_article_category name="participations" not>
<txp:article_custom section="publications" exclude="Category1" limit="100" break="li" wraptag="ul" class="submenu" label="Other Publications" labeltag="h3">
<txp:if_article_id>
<txp:title />
<txp:else />
<a rel="bookmark" href="<txp:permlink />"><txp:title /></a>
</txp:if_article_id>
</txp:article_custom>
</txp:if_article_category>


<txp:if_article_category name="participations">
<txp:article_custom section="publications" category="participations" match="Category1" limit="100" break="li" wraptag="ul" class="submenu" label="Other Publications" labeltag="h3">
<txp:if_article_id>
<txp:title />
<txp:else />
<a rel="bookmark" href="<txp:permlink />"><txp:title /></a>
</txp:if_article_id>
</txp:if_article_category>
</txp:article_custom>
</div>

</div>
<div class="clear">&nbsp;</div>
</txp:if_individual_article>

<txp:hide>==================-end individual articles-======================</txp:hide>

</div><!-- end .container_24 --></div>

<txp:output_form form="colak_foot" />

<txp:output_form form="menu.js" format="flat.script" />
<txp:if_individual_article><txp:output_form form="tabs.js" format="flat.script" /></txp:if_individual_article>

</body>

</html>
