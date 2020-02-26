<article>
<div class="grid_18"><h3><a href="<txp:permlink />" rel="bookmark"><txp:title /></a></h3>
<txp:excerpt />
</div>
<div class="grid_6 meta side" role="complementary">
<txp:variable name="cf_d"><txp:custom_field name="dates" /></txp:variable>
<txp:variable name="cf_t"><txp:custom_field name="type" /></txp:variable>
<txp:if_variable name="cf_t" value="call"><h5>Deadline</h5><txp:else /><h5>Date(s)</h5></txp:if_variable>
<txp:variable name="cf_d" />
<h5>Posted<txp:if_logged_in group="publisher"> <a href="<txp:site_url />textpattern/index.php?event=article&amp;step=edit&amp;ID=<txp:article_id />"><txp:article_id /></a></txp:if_logged_in></h5> 
<p><txp:posted wraptag="" format="%d" /> <txp:posted wraptag="" format="%b" /> <txp:posted wraptag="" format="%Y" />, <txp:posted wraptag="" format="%T" /></p>
</div>
<div class="clear">&nbsp;</div>
</article>
