<div class="line nosmall">
<div class="grid_5 nosmall"><p>Dates</p></div>
<div class="grid_6 nosmall"><p>Title</p></div>
<div class="grid_13 nosmall"><p>Venue</p></div>
<div class="clear nosmall noprint">&nbsp;</div>
</div>

<txp:article_custom section='<txp:section />' category='<txp:category />' break="article" c10="x">
<txp:body />
</txp:article_custom>
<txp:article_custom section='<txp:section />' category='<txp:category />' break="article" c10="">
<div class="grid_5"><txp:if_logged_in group="publisher"><p><a href="<txp:site_url />textpattern/index.php?event=article&amp;step=edit&amp;ID=<txp:article_id />"><txp:custom_field name="dates" escape="" /></a></p><txp:else /><p><txp:custom_field name="dates" escape="" /></p></txp:if_logged_in></div>
<div class="grid_6"><h6><a href="<txp:permlink />" rel="bookmark"><txp:title /></a></h6></div>
<div class="grid_13"><txp:if_custom_field name="venues">
<p><txp:custom_field name="venue" escape="" /> <txp:custom_field name="venues" escape="" /></p>
<txp:else />
<p><txp:custom_field name="venue" escape="" /></p>
</txp:if_custom_field></div>
<div class="clearboth"><hr class="noprint" /></div>
</txp:article_custom>
