<txp:if_yield name="setcookie"><txp:oui_cookie name="accept_vimeo_cookies" duration="+1 year" values="yes" /></txp:if_yield>
<txp:oui_if_cookie name="accept_vimeo_cookies">
<div class="embed-container"<txp:if_yield name="id"> id="<txp:yield name="id" />"</txp:if_yield>><iframe src="https://player.vimeo.com/video/<txp:yield name="video" />?title=0&amp;byline=0&amp;portrait=0" allowfullscreen></iframe></div>
<txp:else />
<div class="vimeoeucookies noprint"><p class="centre">This video, <txp:if_yield name="txt">presenting <txp:yield name="txt" /></txp:if_yield> is hosted by Vimeo on <a rel="external" href="https://vimeo.com/<txp:yield name="video" />">vimeo.com/<txp:yield name="video" /></a>. By viewing it here, you accept Vimeo's <a rel="external" href="https://vimeo.com/privacy">privacy policy</a>.</p><p class="red centre"><a rel="nofollow" href="?accept_vimeo_cookies=yes<txp:if_yield name="id">#<txp:yield name="id" /></txp:if_yield>">View</a></p></div>
</txp:oui_if_cookie>
