<txp:hide>tag: <txp::vimeos cat="cat" txt="yyy" id="vids" /></txp:hide>

<txp:oui_cookie name="accept_vimeo_cookies" duration="+1 year" values="yes" />
<txp:oui_if_cookie name="accept_vimeo_cookies">
<div class="embed-container"<txp:if_yield name="id"> id="<txp:yield name="id" />"</txp:if_yield>><txp:linklist category='<txp:yield name="cat" />' limit="100" sort="id asc" form="" wraptag="div" class="slider"><div class="slide"><div class="embed-container"><iframe src="https://player.vimeo.com/video/<txp:link_description escape="" />?title=0&amp;byline=0&amp;portrait=0" allowfullscreen></iframe></div></div></txp:linklist></div>
<txp:else />
<div class="vimeoeucookies noprint"><p class="centre">These videos, presenting <txp:yield name="txt" /> are hosted by Vimeo on <txp:linklist category='<txp:yield name="cat" />' limit="100" sort="id asc" form="" wraptag="" break=", "><a rel="external" href="https://vimeo.com/<txp:link_description escape="" />">vimeo.com/<txp:link_description escape="" /></a></txp:linklist>. By viewing them here, you accept Vimeo's <a rel="external" href="https://vimeo.com/privacy">privacy policy</a>.</p><p class="red centre"><a rel="nofollow" href="?accept_vimeo_cookies=yes<txp:if_yield name="id">#<txp:yield name="id"/></txp:if_yield>">View</a></p></div></txp:oui_if_cookie>

<div class="clear">&nbsp;</div>
