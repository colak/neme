<txp:if_article_category number="1">
<txp:if_article_category number="2">
<txp:article_custom section match="Category1=2, Category2=3" form="" listform="" c10="y" wraptag="ul" break="li" label='Other <txp:category2 /> in <em><txp:category1 title="1" /></em>' labeltag="h4" class="submenu" limit="999">
<txp:if_article_id>
<span><txp:title /></span>
<txp:else />
<a href="<txp:permlink />" rel="bookmark"><txp:title /></a>
</txp:if_article_id>
</txp:article_custom>
<txp:else />
<txp:article_custom label='More on <em><txp:category1 title="1" /></em>' labeltag="h4" section='<txp:section />' category='<txp:category1 />' form="" C10="" istform="" limit="100" wraptag="ul" break="li" class="submenu">
<txp:if_article_id>
<span><txp:title /></span>
<txp:else />
<a href="<txp:permlink />" rel="bookmark"><txp:title /></a>
</txp:if_article_id>
</txp:article_custom>

</txp:if_article_category>
<txp:else />
<txp:article_custom status section='<txp:section />' limit="0" breakby="<txp:posted format='%Y' />" breakform="accordion-item" label='More <txp:section />' labeltag="h4" c10="x">
<li>
<txp:if_article_category>
<txp:if_custom_field name="status" value="5">
<span class="preg"><a href="/<txp:section />/<txp:category1 />/" rel="bookmark"><txp:title /></a></span>
</txp:if_custom_field>
<txp:else />
<txp:if_article_id>
<txp:variable name="year" value='<txp:posted format="%Y" />' />
<txp:title wraptag="span" />
<txp:else />
<a href="<txp:permlink />" rel="bookmark"><txp:title /></a>
</txp:if_article_id>
</txp:if_article_category>
</li>
</txp:article_custom>
</txp:if_article_category>




