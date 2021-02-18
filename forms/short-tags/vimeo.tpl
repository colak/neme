<txp:if_yield name="setcookie" value="1"><txp:oui_cookie name="accept_vimeo_cookies" duration="+1 year" values="yes" /></txp:if_yield>
<txp:oui_if_cookie name="accept_vimeo_cookies">
<div class="embed-container"<txp:if_yield name="id"> id="<txp:yield name="id" />"</txp:if_yield>><iframe loading="lazy" src="https://player.vimeo.com/video/<txp:yield name="video" />?title=0&amp;byline=0&amp;portrait=0" allowfullscreen></iframe></div>
<noscript><div class="announce"><p>JavaScript is currently disabled in your browser. Activate it for the best experience.</p></div></noscript>
<txp:else />
<div class="grid_24 alpha omega vcontain noprint">
<txp:if_yield name="vimg"><div class="vim1"><txp:image id='<txp:yield name="vimg" />' class="grid_24 alpha omega noprint" /></div></txp:if_yield>
<div class="vimeoeucookies noprint">
<p class="centre">We would like you to watch this <txp:if_yield name="other"><txp:yield name="other" /><txp:else />NeMe produced</txp:if_yield> video, <txp:yield name="txt" wraptag="presenting <+>" /> uploaded on <a rel="external noopener" href="https://vimeo.com/<txp:yield name="video" />">vimeo.com/<txp:yield name="video" /></a>.<br />By viewing it here, you accept Vimeo's <a rel="external noopener" href="https://vimeo.com/privacy">privacy policy</a>.</p><p class="red centre"><a rel="nofollow noindex noodp noydir nofollow" href="?accept_vimeo_cookies=yes<txp:if_yield name="id">#<txp:yield name="id" /></txp:if_yield>">View it here</a></p><p>Note that Vimeo only serves First Party cookies for embedded videos in our site, but acording to their <a rel="external noopener" href="https://vimeo.com/cookie_policy">cookie policy</a>, more cookies are used should you wish to view any content in their website.</p>
</div></div><div class="clear">&nbsp;</div>
</txp:oui_if_cookie>
