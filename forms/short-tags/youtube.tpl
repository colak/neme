<txp:if_yield name="setcookie" value="1"><txp:oui_cookie name="accept_youtube" duration="+1 year" values="yes" /></txp:if_yield>
<txp:oui_if_cookie name="accept_youtube">
<div class="embed-container"<txp:if_yield name="id"> id="<txp:yield name="id" />"</txp:if_yield>><iframe src="https://www.youtube.com/embed/<txp:yield name="video" />" frameborder="0" allowfullscreen></iframe></div>
<txp:else />
<div class="vimeoeucookies noprint">
<p class="centre">We would very much like you to watch this video, <txp:yield name="txt" wraptag="presenting <+>" /> uploaded on YouTube on <a rel="external" href="https://www.youtube.com/watch?v=<txp:yield name="video" />">https://www.youtube.com/watch?v=<txp:yield name="video" /></a>.<br />By viewing it here, you accept YouTube's <a rel="external" href="https://www.youtube.com/intl/en-GB/yt/about/policies/">privacy policy</a>.</p><p class="red centre"><a rel="nofollow" href="?accept_youtube=yes<txp:if_yield name="id">#<txp:yield name="id" /></txp:if_yield>">View it here</a></p></div>
</txp:oui_if_cookie>
