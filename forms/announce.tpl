<h3>Announcements</h3>
<div class="announce">
<txp:linklist category="active,ongoing" sort="id desc" limit="10" break="li" wraptag="ul">
<txp:variable name="external noopener" value='<txp:link_description />' />
<txp:if_variable name="external noopener" value="ext">
<a href="<txp:link_url />" rel="external noopener"><txp:link_name escape="html" /></a>
<txp:else />
<a href="<txp:link_url />"><txp:link_name escape="html" /></a>
</txp:if_variable>
</txp:linklist>
</div>
