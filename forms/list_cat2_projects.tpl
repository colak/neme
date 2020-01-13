<article class="grid_18">
<txp:if_custom_field name="status" value="5">
<h3><a href="/<txp:section />/<txp:category1 />/<txp:category2 />/" rel="bookmark"><txp:title /></a></h3>
<txp:else />
<h3><a href="<txp:permlink />" rel="bookmark"><txp:title /></a></h3>
</txp:if_custom_field>
<txp:excerpt />
</article>
<div class="grid_6 meta side" role="complementary">
<txp:if_custom_field name="dates"><h5>Date(s)<txp:if_logged_in group="publisher"> <a href="<txp:site_url />textpattern/index.php?event=article&amp;step=edit&amp;ID=<txp:article_id />"><txp:article_id /></a></txp:if_logged_in></h5><txp:custom_field name="dates" /></txp:if_custom_field>

<txp:if_custom_field name="venues"><h5>Venues</h5><txp:custom_field name="venue" /><txp:custom_field name="venues" /><txp:else /><h5>Venue</h5><txp:custom_field name="venue" /></txp:if_custom_field>
</div>
<div class="clearboth"><hr class="noprint" /></div>
