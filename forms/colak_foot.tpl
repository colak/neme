<div id="footer" role="contentinfo">

<txp:if_section name="related-links">
<div id="social" class="nosmall"><div class="container_24">
<txp:oui_cookie name="accept_fb_cookies" duration="+1 year" values="yes" />
<txp:oui_if_cookie name="accept_fb_cookies">
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.12';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<div class="grid_12 socialfeed"><div class="fb-page" data-href="https://www.facebook.com/NeMeArtsCentre/" data-tabs="timeline" data-width="450" data-height="500" data-small-header="true" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="false"><blockquote cite="https://www.facebook.com/NeMeArtsCentre/" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/NeMeArtsCentre/">NeMe</a></blockquote></div>
</div>
<txp:else />
<div class="grid_12 socialeucookies"><p class="centre">This is the space we embed our Facebook feed. By viewing it here you agree with Facebook's <a rel="external" href="https://facebook.com/about/privacy/">Privacy Policy</a>.</p><p class="centre"><a class="red" rel="nofollow" href="?accept_fb_cookies=yes">View Facebook feed</a></p></div>
</txp:oui_if_cookie>

<txp:oui_cookie name="accept_twitter_cookies" duration="+1 year" values="yes" />
<txp:oui_if_cookie name="accept_twitter_cookies">
<div class="grid_12 socialfeed"><a class="twitter-timeline" data-lang="en" data-width="470" data-height="500" data-link-color="#cc0000" href="https://twitter.com/NeMeOrg?ref_src=twsrc%5Etfw">Tweets by NeMeOrg</a> <script async src="https://platform.twitter.com/widgets.js"></script></div>
</div>
<txp:else />
<div class="grid_12 socialeucookies"><p class="centre">This is the space we embed our Twitter feed. By viewing it here, you agree with Twitter's <a rel="external" href="https://twitter.com/privacy?lang=en">Privacy Policy</a>.</p><p class="centre"><a class="red" rel="nofollow" href="?accept_twitter_cookies=yes">View Twitter feed</a></p></div>
</txp:oui_if_cookie>

<div class="clear">&nbsp;</div></div></div></txp:if_section>

<div class="container_24">
<div class="grid_18" id="searchsites">
<txp:output_form form="colak-search" />
<txp:hide><txp:search_input match="any" /></txp:hide>
</div>

<div class="grid_6" id="copyright">
<p><a href="<txp:site_url />about/privacy-policy" rel="license">Privacy policy</a> <txp:article_custom id="178">(Modified on <txp:modified format="%d %B %G at %r" />)</txp:article_custom><br />
This site has <txp:article_custom section="participations,events,about,blog,texts,nac,workshops" pageby="1" pgonly /> posts since it was launched <txp:fha_time_diff year="2004" month="11" day="18" /> ago and it was last modified on 
<txp:article_custom section="events,participations,texts,blog,about" sort="LastMod desc" limit="1" form="">
<txp:modified format="%d %B %G at %r" />.
</txp:article_custom><br />
<span class="nosmall">Standards: <a href="http://wave.webaim.org/refer" rel="nofollow">Accessibility</a>, <a href="http://feedvalidator.org/check.cgi?url=http://www.neme.org/rss/" rel="nofollow">RSS</a>, <a href="http://feedvalidator.org/check.cgi?url=http://www.neme.org/atom/" rel="nofollow">ATOM</a>, <a href="http://validator.w3.org/check?uri=referer" rel="nofollow">HTML5</a>, <a href="http://jigsaw.w3.org/css-validator/validator?uri=http%3A%2F%2Fwww.neme.org%2Fcss%2Fneme960%2Fdefault.css&amp;profile=css3&amp;usermedium=all&amp;warning=1&amp;vextwarning=&amp;lang=en" rel="nofollow">CSS</a>  
<txp:if_search>
<txp:else />
<txp:if_article_list>
<txp:if_section name="">
and <a rel="nofollow" href="https://developers.google.com/speed/pagespeed/insights/?url=http%3A%2F%2Fwww.neme.org">optimisation</a>
<txp:else />
and <a rel="nofollow" href="https://developers.google.com/speed/pagespeed/insights/?url=http%3A%2F%2Fwww.neme.org%2F<txp:section />%2F">optimisation</a>
</txp:if_section>
<txp:else />
and <a rel="nofollow" href="https://developers.google.com/speed/pagespeed/insights/?url=<txp:permlink />">optimisation</a>
</txp:if_article_list>
</txp:if_search>.</span></p>
</div>

<div class="clear">&nbsp;</div>

</div><!-- end .container_24 --></div>
