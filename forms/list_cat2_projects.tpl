<txp:if_custom_field name="status" value="5">
<article class="preg">
<div class="grid_18">
<h3><strong><a href="/<txp:section />/<txp:category1 />/<txp:category2 />/" rel="bookmark"><txp:title /></a></strong></h3>
<txp:excerpt />
</div>
<div class="grid_6 meta side" role="complementary">
<txp:if_custom_field name="dates">
<h5>Date(s)<txp:if_logged_in group="publisher"> <a href="<txp:site_url />textpattern/index.php?event=article&amp;step=edit&amp;ID=<txp:article_id />"><txp:article_id /></a></txp:if_logged_in></h5><txp:custom_field name="dates" />
</txp:if_custom_field>

<txp:if_custom_field name="venues">
<h5>Venues</h5>
<txp:custom_field name="venue" /><txp:custom_field name="venues" />
<txp:else />
<txp:if_custom_field name="venue">
<h5>Venue</h5>
<txp:custom_field name="venue" />
</txp:if_custom_field>
</txp:if_custom_field>
</div>
<div class="clear">&nbsp;</div>
</article>

<txp:else />

<article>
<div class="grid_18">
<h3><a href="<txp:permlink />" rel="bookmark"><txp:title /></a></h3>
<txp:excerpt />
</div>
<div class="grid_6 meta side" role="complementary">
<txp:if_custom_field name="dates">
<h5>Date(s)<txp:if_logged_in group="publisher"> <a href="<txp:site_url />textpattern/index.php?event=article&amp;step=edit&amp;ID=<txp:article_id />"><txp:article_id /></a></txp:if_logged_in></h5><txp:custom_field name="dates" />
</txp:if_custom_field>

<txp:if_custom_field name="venues">
<h5>Venues</h5>
<txp:custom_field name="venue" /><txp:custom_field name="venues" />
<txp:else />
<txp:if_custom_field name="venue">
<h5>Venue</h5>
<txp:custom_field name="venue" />
</txp:if_custom_field>
</txp:if_custom_field>
</div><div class="clear">&nbsp;</div>
</article>
</txp:if_custom_field>
