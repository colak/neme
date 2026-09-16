<txp:oui_if_cookie name='<txp:yield name="cookie" />'>
<txp:yield name="life" />, <a rel="nofollow noopener" href="?_NeMe_delete_cookie=<txp:yield name="cookie" />">Delete cookie</a>
<txp:variable name="delete_cookie" value='<txp:php> echo gps("_NeMe_delete_cookie"); </txp:php>' />
<txp:if_variable name="delete_cookie" value='<txp:yield name="cookie" />' match="exact">
<txp:oui_cookie name='<txp:yield name="cookie" />' delete />
</txp:if_variable>
<txp:else />
<txp:yield name="life" />
</txp:oui_if_cookie>
