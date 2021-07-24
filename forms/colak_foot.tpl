<div id="footer" role="contentinfo">

<div class="container_24">
<div class="grid_18" id="searchsites">
<txp:output_form form="colak-search" />
<txp:hide><txp:search_input match="all" /></txp:hide>
</div>

<txp:act_if_mobile><div class="grid_24" id="copyright"><txp:else /><div class="grid_6" id="copyright"></txp:act_if_mobile>
<p><a href="<txp:site_url />about/privacy-policy" rel="license">Privacy policy</a> <txp:article_custom id="2178">(Modified on <txp:modified format="%d %B %G at %r" />)</txp:article_custom><br />
This site archives <txp:article_custom section="projects,about,blog,texts" pageby="1" pgonly escape="number" /> posts since it was launched <txp:fha_time_diff year="2004" month="8" day="18" /> ago and it was last modified on 
<txp:article_custom section="projects,texts,blog,about" sort="LastMod desc" limit="1" form="">
<txp:modified format="%d %B %G at %r" />.
</txp:article_custom><br />
<txp:if_logged_in><span class="nosmall">Standards: <a href="http://wave.webaim.org/refer" rel="nofollow">Accessibility</a>, <a href="http://feedvalidator.org/check.cgi?url=<txp:site_url />rss/" rel="nofollow">RSS</a>, <a href="http://feedvalidator.org/check.cgi?url=<txp:site_url />atom/" rel="nofollow">ATOM</a>, <a href="http://validator.w3.org/check?uri=referer" rel="nofollow">HTML5</a>, <a href="http://jigsaw.w3.org/css-validator/validator?uri=https%3A%2F%2Fwww.neme.org%2Fcss%2Fneme960%2Fdefault.css&amp;profile=css3&amp;usermedium=all&amp;warning=1&amp;vextwarning=&amp;lang=en" rel="nofollow">CSS</a> 
<txp:if_search>
<txp:else />
<txp:if_article_list>
<txp:if_section name="">
and <a rel="nofollow" href="https://developers.google.com/speed/pagespeed/insights/?url=https%3A%2F%2Fwww.neme.org">optimisation</a>
<txp:else />
and <a rel="nofollow" href="https://developers.google.com/speed/pagespeed/insights/?url=https%3A%2F%2Fwww.neme.org%2F<txp:section />%2F<txp:category1 />%2F">optimisation</a>
</txp:if_section>
<txp:else />
and <a rel="nofollow" href="https://developers.google.com/speed/pagespeed/insights/?url=<txp:permlink />">optimisation</a>
</txp:if_article_list>
</txp:if_search>.</span></p></txp:if_logged_in>
</div>

<div class="clear">&nbsp;</div>

</div><!-- end .container_24 --></div>
