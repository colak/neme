<txp:header name="Content-Type" value="application/xml; charset=utf-8" />
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
<txp:variable name="siteurl"><txp:site_url /></txp:variable>
<url><loc><txp:variable name="siteurl" /></loc><changefreq>always</changefreq></url>
<txp:section_list break="" exclude="sitemap,newsletter-unsubscribe,test">
<url>
<loc><txp:section url="1" /></loc>
<txp:evaluate test="article_custom"><lastmod><txp:article_custom section='<txp:section />' limit="1" exclude="2240,2241" sort="LastMod desc" status="live"><txp:modified format="w3c" /></txp:article_custom></lastmod></txp:evaluate><changefreq>weekly</changefreq></url>
</txp:section_list>

<url><loc><txp:variable name="siteurl" />projects/state-machines/</loc><changefreq>yearly</changefreq></url>
<url><loc><txp:variable name="siteurl" />projects/toolkit-of-care/</loc><changefreq>monthly</changefreq></url>
<url><loc><txp:variable name="siteurl" />projects/a-sea-change/</loc><changefreq>yearly</changefreq></url>
<url><loc><txp:variable name="siteurl" />projects/emap/</loc><changefreq>monthly</changefreq></url>
<url><loc><txp:variable name="siteurl" />projects/ttr/</loc><changefreq>yearly</changefreq></url>
<url><loc><txp:variable name="siteurl" />projects/respublika/</loc><changefreq>yearly</changefreq></url>
<url><loc><txp:variable name="siteurl" />projects/respublika/archive/</loc><changefreq>yearly</changefreq></url>
<url><loc><txp:variable name="siteurl" />projects/respublika/exhibitions/</loc><changefreq>yearly</changefreq></url>
<url><loc><txp:variable name="siteurl" />projects/respublika/workshops/</loc><changefreq>yearly</changefreq></url>
<url><loc><txp:variable name="siteurl" />projects/respublika/screenings/</loc><changefreq>yearly</changefreq></url>
<url><loc><txp:variable name="siteurl" />projects/respublika/seminars/</loc><changefreq>yearly</changefreq></url>
<url><loc><txp:variable name="siteurl" />projects/respublika/performances/</loc><changefreq>yearly</changefreq></url>
<url><loc><txp:variable name="siteurl" />publications/cited/</loc><lastmod><txp:article_custom id="2373"><txp:modified format="w3c" /></txp:article_custom></lastmod><changefreq>weekly</changefreq></url>
<url><loc><txp:variable name="siteurl" />publications/mentioned/</loc><lastmod><txp:article_custom id="2375"><txp:modified format="w3c" /></txp:article_custom></lastmod><changefreq>weekly</changefreq></url>

<txp:article_custom section="projects,about,texts,blog" exclude="2001,2189,2190,2240,2241,2372" limit="9999" status="live">
<url>
<loc><txp:permlink /></loc>
<lastmod><txp:evaluate query='<txp:posted format="%s" /> < <txp:modified format="%s" />'><txp:modified format="w3c" /><txp:else /><txp:posted format="w3c" /></txp:evaluate></lastmod>
</url>
</txp:article_custom>

<txp:variable name="latest_posted_article"><txp:article_custom section="blog" limit="1" exclude="2240,2241" sort="posted desc" status="live"><txp:modified format="w3c" /></txp:article_custom></txp:variable>

<txp:php>
$siteUrl = 'https://www.neme.org';
$section = 'blog';
$startPage = 2;
$endPage = 174;
$latestModified = '<txp:variable name="latest_posted_article" />';

for ($i = $startPage; $i <= $endPage; $i++) {
echo "<url>";
echo "<loc>{$siteUrl}/{$section}/?pg={$i}</loc>";
echo "<lastmod>{$latestModified}</lastmod>";
echo "</url>";
}
</txp:php>

</urlset>
