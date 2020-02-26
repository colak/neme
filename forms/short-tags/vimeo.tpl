<txp:if_yield name="setcookie" value="1"><txp:oui_cookie name="accept_vimeo_cookies" duration="+1 year" values="yes" /></txp:if_yield>
<txp:oui_if_cookie name="accept_vimeo_cookies">
<div class="embed-container"<txp:if_yield name="id"> id="<txp:yield name="id" />"</txp:if_yield>><iframe src="https://player.vimeo.com/video/<txp:yield name="video" />?title=0&amp;byline=0&amp;portrait=0" allowfullscreen></iframe></div>
<txp:else />
<div class="grid_24 alpha omega"><div class="vimeoeucookies noprint">
<p class="centre">We would like you to watch this <txp:if_yield name="other"><txp:yield name="other" /><txp:else />NeMe produced</txp:if_yield> video, <txp:yield name="txt" wraptag="presenting <+>" /> uploaded on <a rel="external" href="https://vimeo.com/<txp:yield name="video" />">vimeo.com/<txp:yield name="video" /></a>.<br />By viewing it here, you accept Vimeo's <a rel="external" href="https://vimeo.com/privacy">privacy policy</a>.</p><p class="red centre"><a rel="nofollow" href="?accept_vimeo_cookies=yes<txp:if_yield name="id">#<txp:yield name="id" /></txp:if_yield>">View it here</a></p><p>Note that Vimeo only serves First Party cookies for embedded videos in our site, but acording to their <a rel="external" href="https://vimeo.com/cookie_policy">cookie policy</a>, more cookies are used should you wish to view any content in their website.</p>
</div></div><div class="clear">&nbsp;</div>
</txp:oui_if_cookie>
