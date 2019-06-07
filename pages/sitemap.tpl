<txp:header value="application/xml; charset=utf-8" /><?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
<url><loc><txp:site_url /></loc></url>
<txp:section_list break="" exclude="sitemap,newsletter,contact">
<url>
<loc><txp:section url="1" /></loc>
<txp:evaluate test="article_custom">
<lastmod><txp:article_custom section='<txp:section />' limit="1" exclude="2001,2002,2044" sort="LastMod desc" status><txp:modified format="%Y-%m-%d" /></txp:article_custom></lastmod>
</txp:evaluate>
</url>
</txp:section_list>
<txp:article_custom section="events,participations,about,texts,blog" exclude="2001,2002,2044" limit="9999" status>
<url><loc><txp:permlink /></loc><lastmod><txp:modified format="%Y-%m-%dT%H:%M:%SZ" /></lastmod></url>
</txp:article_custom>
</urlset>
