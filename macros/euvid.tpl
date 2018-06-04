<txp:hide>
Attributes
| video | | |
| presenting | | |
| id | vid | |
Tag: <txp:euvid video="###" presenting="something here" id="vid" />
</txp:hide>

 <txp:oui_cookie name="accept_vimeo_cookies" values="yes" />
 <txp:oui_if_cookie name="accept_vimeo_cookies">
 <div class="embed-container" id="{id}">
 <iframe src="https://player.vimeo.com/video/{video}?title=0&amp;byline=0&amp;portrait=0" allowfullscreen></iframe>
 </div><txp:else />
 <div class="vimeoeucookies noprint">
 <p class="centre">This video, presenting {presenting} is hosted by Vimeo on <a rel="external" href="https://vimeo.com/{video}">vimeo.com/{video}</a>. By viewing it here, you accept Vimeo's <a rel="external" href="https://vimeo.com/privacy">privacy policy</a>.</p><p class="red centre"><a rel="nofollow" href="?accept_vimeo_cookies=yes#{id}">View</a></p>
 </div>
 </txp:oui_if_cookie>
