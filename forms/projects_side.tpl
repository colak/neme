<txp:if_article_category number="1">
<txp:related_articles label='Other <txp:category1 /> <txp:section />' labeltag="h4" section='<txp:section />' category='<txp:category1 />' form="" listform="" limit="100" wraptag="ul" break="li" class="submenu">
<a href="<txp:permlink />" rel="bookmark"><txp:title /></a>
</txp:related_articles>
<txp:else />
<txp:article_custom label='Other <txp:section />' labeltag="h4" status limit="99" section='<txp:section />' form="" listform="" wraptag="ul" break="li" c10="x" class="submenu">
<txp:if_custom_field name="status" value="5">
<a href="/<txp:section />/<txp:category1 />/" rel="bookmark"><txp:title /></a>
<txp:else />
<txp:if_article_id>
<span><txp:title /></span>
<txp:else />
<a href="<txp:permlink />" rel="bookmark"><txp:title /></a>
</txp:if_article_id>
</txp:if_custom_field>
</txp:article_custom>
</txp:if_article_category>
