<txp:header name="Content-Type" value="application/xml; charset=utf-8" />
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
<url><loc><txp:site_url /></loc></url>
<txp:section_list break="" exclude="sitemap,newsletter-unsubscribe">
<url>
<loc><txp:section url="1" /></loc>
<txp:evaluate test="article_custom">
<lastmod><txp:article_custom section='<txp:section />' limit="1" exclude="2240,2241" sort="LastMod desc" status="live"><txp:modified format="%Y-%m-%dT%H:%M:%SZ" /></txp:article_custom></lastmod>
</txp:evaluate>
</url>
</txp:section_list>
<url><loc><txp:site_url />projects/state-machines/</loc></url>
<url><loc><txp:site_url />projects/ttr/</loc></url>
<url><loc><txp:site_url />projects/respublika/</loc></url>
<url><loc><txp:site_url />projects/respublika/exhibitions/</loc></url>
<url><loc><txp:site_url />projects/respublika/workshops/</loc></url>
<url><loc><txp:site_url />projects/respublika/screenings/</loc></url>
<url><loc><txp:site_url />projects/respublika/seminars/</loc></url>
<url><loc><txp:site_url />projects/respublika/performances/</loc></url>
<url><loc><txp:site_url />publications/cited/</loc></url>
<txp:article_custom section="projects,about,texts,blog" exclude="2001,2189,2190,2240,2241" limit="9999" status="live">
<url><loc><txp:permlink /></loc><lastmod><txp:modified format="%Y-%m-%dT%H:%M:%SZ" /></lastmod></url>
</txp:article_custom>
</urlset>
