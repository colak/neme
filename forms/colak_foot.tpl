<div id="footer" role="contentinfo">

<div class="container_24">
<div class="grid_18" id="searchsites">
<p>This site archives <txp:article_custom section="projects,about,blog,texts,publications" pageby="1" pgonly escape="number" /> posts since NeMe was founded <txp:fha_time_diff year="2004" month="11" day="18" /> ago and it was last modified on 
<txp:article_custom section="projects,texts,blog,about,publications" sort="LastMod desc" limit="1" form="">
<txp:modified format="%d %B %G 'at' %I:%M:%S %p" />.
</txp:article_custom></p>
<txp:output_form form="colak-search" />
<txp:hide><txp:search_input match="all" /></txp:hide>
</div>

<txp:act_if_mobile><div class="grid_24" id="copyright"><txp:else /><div class="grid_6" id="copyright"></txp:act_if_mobile>

<txp:article_custom id="2178,2430" wraptag="p" break="br"><a rel="licence" href="<txp:permlink />"><txp:title /></a> (Modified on <txp:modified format="%d %B %G 'at' %r" />)</txp:article_custom>

<txp:if_logged_in><p><span class="nosmall">Standards: <a href="http://wave.webaim.org/refer" rel="nofollow">Accessibility</a>, <a href="http://feedvalidator.org/check.cgi?url=<txp:site_url />rss/" rel="nofollow">RSS</a>, <a href="http://feedvalidator.org/check.cgi?url=<txp:site_url />atom/" rel="nofollow">ATOM</a>, <a href="http://validator.w3.org/check?uri=referer" rel="nofollow">HTML5</a>, <a href="http://jigsaw.w3.org/css-validator/validator?uri=https%3A%2F%2Fwww.neme.org%2Fcss%2Fneme960%2Fdefault.css&amp;profile=css3&amp;usermedium=all&amp;warning=1&amp;vextwarning=&amp;lang=en" rel="nofollow">CSS</a> 
<txp:if_search>
<txp:else />
<txp:if_article_list>
<txp:if_section name="">
and <a rel="nofollow" href="https://developers.google.com/speed/pagespeed/insights/?url=https%3A%2F%2Fwww.neme.org">optimisation</a>
<txp:else />
and <a rel="nofollow" href="https://developers.google.com/speed/pagespeed/insights/?url=https%3A%2F%2Fwww.neme.org%2F<txp:section />%2F<txp:category1 />%2F">optimisation</a>
</txp:if_section>
<txp:else />
and <a rel="nofollow" href="https://developers.google.com/speed/pagespeed/insights/?url=<txp:permlink />">optimisation</a>.
</txp:if_article_list>
</txp:if_search></span></p></txp:if_logged_in>
</div>

<div class="clear">&nbsp;</div>

<div class="grid_24">
<txp:if_article_list>

<txp:if_section name="about">
<p>&copy; 2004-<txp:date format="%Y" /> <a href="<txp:site_url />">NeMe</a>.</p>
</txp:if_section>
<txp:if_section name="projects,texts">
<p>&copy; 2004-<txp:date format="%Y" /> <a href="<txp:site_url />">NeMe</a> and/or respective contributors.</p>
</txp:if_section>
<txp:if_section name="blog">
<p>2004-<txp:date format="%Y" /> The content in the <a href="/blog/">Blog</a> section of this site is licensed under a <a rel="external" href="https://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0</a> International license.</p>
</txp:if_section>
<txp:if_section name="publications,related-links,newsletter-unsubscribe,default">
<p>&copy; 2004-<txp:date format="%Y" /> <a href="<txp:site_url />">NeMe</a>.</p>
</txp:if_section>
</txp:if_article_list>

<txp:if_individual_article>
<txp:variable name="year" value='<txp:date format="%Y" />' />

<txp:if_article_section name="texts">
<txp:variable name="textauthor"><txp:linklist id='<txp:custom_field name="venue" escape="" />' break=" &amp; " wraptag=""><span itemscope itemtype="http://schema.org/Text"><span itemprop="author"><txp:link_name /></span></span></txp:linklist></txp:variable>

<txp:if_variable name="year" value='<txp:posted format="%Y" />'>
&copy; 2004-<txp:date format="%Y" /> <a href="<txp:site_url />">NeMe</a> &#10145; Text &copy; <txp:variable name="year" /> <txp:variable name="textauthor" />
<txp:else />
&copy; 2004-<txp:date format="%Y" /> <a href="<txp:site_url />">NeMe</a> &#10145; Text &copy; <txp:posted format="%Y" />-<txp:variable name="year" /> <txp:variable name="textauthor" />
</txp:if_variable>
</txp:if_article_section>

<txp:if_article_section name="about">
<txp:if_variable name="year" value='<txp:posted format="%Y" />'>
&copy; <txp:variable name="year" /> <a href="<txp:site_url />">NeMe</a>.
<txp:else />
&copy; <txp:posted format="%Y" />-<txp:variable name="year" /> <a href="<txp:site_url />">NeMe</a>.
</txp:if_variable>
</txp:if_article_section>

<txp:if_article_section name="projects">
<txp:if_variable name="year" value='<txp:posted format="%Y" />'>
&copy; <txp:variable name="year" /> <a href="<txp:site_url />">NeMe</a> and/or respective contributors.
<txp:else />
&copy; <txp:posted format="%Y" />-<txp:variable name="year" /> <a href="<txp:site_url />">NeMe</a> and/or respective contributors.
</txp:if_variable>
</txp:if_article_section>

<txp:if_article_section name="blog">
2004-<txp:date format="%Y" /> The content in the <a href="/blog/">Blog</a> section of this site is licensed under a <a rel="external" href="https://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0</a> International license.
</txp:if_article_section>

</txp:if_individual_article>
</div>
</div><!-- end .container_24 --></div>
