<txp:if_yield name="caption">
<figure<txp:if_yield name="class"> class="<txp:yield name="class" />"</txp:if_yield>>
<txp:image id='<txp:yield name="id" />' />
<figcaption class="grid_24"><txp:yield name="caption" escape="tidy,textile" /></figcaption>
</figure>
<txp:else />
<txp:image id='<txp:yield name="id" />'<txp:if_yield name="class"> class='<txp:yield name="class" />'</txp:if_yield> />
</txp:if_yield>
