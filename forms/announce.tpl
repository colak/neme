<txp:linklist category="active" sort="id desc" limit="10" break="li" wraptag="ul">
<txp:variable name="external" value='<txp:link_description />' />
<txp:if_variable name="external" value="ext">
<a href="<txp:link_url />" rel="external"><txp:link_name escape="html" /></a>
<txp:else />
<a href="<txp:link_url />"><txp:link_name escape="html" /></a>
</txp:if_variable>
</txp:linklist>
