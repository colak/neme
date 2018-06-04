<txp:hide>
Attributes
| cat | | |
| presenting | | |
| id | vids | |
Tag:  <txp:euvids cat="link_category_name" presenting="something here" />
</txp:hide>


<txp:oui_cookie name="accept_vimeo_cookies" values="yes" />
<txp:oui_if_cookie name="accept_vimeo_cookies">
<div class="embed-container" id="{id}">
<txp:linklist category="{cat}" limit="100" sort="id asc" form="" wraptag="div" class="slider">
<div class="slide">
<div class="embed-container">
<iframe src="https://player.vimeo.com/video/<txp:link_description escape="" />?title=0&amp;byline=0&amp;portrait=0" allowfullscreen></iframe>
</div>
</div>
</txp:linklist>
</div>
<txp:else />
<div id="vimeoeucookies" class="noprint">
<p class="centre">These videos, presenting {presenting} are hosted by Vimeo on <txp:linklist category="{cat}" limit="100" sort="id asc" form="" wraptag="" break=", "><a rel="external" href="https://vimeo.com/<txp:link_description escape="" />">vimeo.com/<txp:link_description escape="" /></a></txp:linklist>. By viewing them here, you accept Vimeo's <a rel="external" href="https://vimeo.com/privacy">privacy policy</a>.</p>
<p class="red centre"><a rel="nofollow" href="?accept_vimeo_cookies=yes#{id}">View</a></p>
</div>
</txp:oui_if_cookie>

<div class="clear">&nbsp;</div>
