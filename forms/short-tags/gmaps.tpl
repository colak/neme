<txp:if_yield name="setcookie" value="1"><txp:oui_cookie name="accept_gmaps" duration="+1 year" values="yes" /></txp:if_yield>
<txp:oui_if_cookie name="accept_youtube">
<div class="embed-container"><iframe src="https://www.google.com/maps/d/embed?mid=<txp:yield name="id" />" width="720" height="480"></iframe></div>
<txp:else />
<div class="vimeoeucookies noprint"><p class="centre">We have indicated the location(s) of this project on Google Maps on<br /><a rel="external noopener" href="https://www.google.com/maps/d/embed?mid=<txp:yield name="id" />">www.google.com/maps/d/embed?mid=<txp:yield name="id" /></a>.<br />By viewing it here you accept Google's <a rel="external noopener" href="https://policies.google.com/">privacy policy</a>.</p><p class="red centre"><a rel="nofollow" href="?accept_gmaps=yes<txp:if_yield name="id">#<txp:yield name="id" /></txp:if_yield>">View it here</a></p></div>
</txp:oui_if_cookie>
