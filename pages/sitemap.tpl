<txp:header name="Content-Type" value="application/xml; charset=utf-8" />
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
<txp:variable name="siteurl"><txp:site_url /></txp:variable>
<url><loc><txp:variable name="siteurl" /></loc></url>
<txp:section_list break="" exclude="sitemap,newsletter-unsubscribe">
<url>
<loc><txp:section url="1" /></loc>
<txp:evaluate test="article_custom"><lastmod><txp:article_custom section='<txp:section />' limit="1" exclude="2240,2241" sort="LastMod desc" status="live"><txp:modified format="w3c" /></txp:article_custom></lastmod></txp:evaluate></url>
</txp:section_list>

<txp:hide>
<txp:section_list>
<txp:page_url s="blog">
<txp:pages total='<txp:article_custom section="blog" pgonly limit="10" listform="" form="" />' />
<txp:pages total shift link="" break="" s="blog">
<url><loc><txp:yield item="url" /></loc></url>
</txp:pages>
</txp:page_url>
</txp:section_list>
</txp:hide>

<url><loc><txp:variable name="siteurl" />projects/state-machines/</loc></url>
<url><loc><txp:variable name="siteurl" />projects/a-sea-change/</loc></url>
<url><loc><txp:variable name="siteurl" />projects/emap/</loc></url>
<url><loc><txp:variable name="siteurl" />projects/ttr/</loc></url>
<url><loc><txp:variable name="siteurl" />projects/respublika/</loc></url>
<url><loc><txp:variable name="siteurl" />projects/respublika/exhibitions/</loc></url>
<url><loc><txp:variable name="siteurl" />projects/respublika/workshops/</loc></url>
<url><loc><txp:variable name="siteurl" />projects/respublika/screenings/</loc></url>
<url><loc><txp:variable name="siteurl" />projects/respublika/seminars/</loc></url>
<url><loc><txp:variable name="siteurl" />projects/respublika/performances/</loc></url>
<url><loc><txp:variable name="siteurl" />publications/cited/</loc></url>
<txp:article_custom section="projects,about,texts,blog" exclude="2001,2189,2190,2240,2241" limit="9999" status="live">
<url><loc><txp:permlink /></loc>
<lastmod><txp:evaluate query='<txp:posted format="%s" /> < <txp:modified format="%s" />'><txp:modified format="w3c" /><txp:else /><txp:posted format="w3c" /></txp:evaluate></lastmod></url>
</txp:article_custom>
</urlset>
