<div class="grid_18" role="main" id="main">
<txp:if_custom_field name="img2"><txp:image id='<txp:custom_field name="img2" />' class="grid_8" /><txp:else />
<txp:if_custom_field name="img_main"><txp:image id='<txp:custom_field name="img_main" />' class="grid_24 alpha omega" /><div class="clear">&nbsp;</div></txp:if_custom_field>
</txp:if_custom_field>

<article>
<h1><txp:title /></h1>
<!--googleoff: all--><p class="printonly"><txp:site_url trim="/" /><txp:page_url /></p><!--googleon: all-->
<txp:body /></article>

<div class="clearboth"><hr class="noprint" /></div>
<txp:variable name="prev1" value='<txp:link_to_prev />' />
<txp:if_variable name="prev1" value="">
<div class="prev grid_12">&nbsp;</div>
<txp:else />
<div class="prev grid_12">&#8612; <txp:link_to_prev><txp:prev_title /></txp:link_to_prev></div>
</txp:if_variable>
<txp:variable name="next1" value='<txp:link_to_next />' />
<txp:if_variable name="next1" value="">
<div class="prev grid_12">&nbsp;</div>
<txp:else />
<div class="next grid_12 aright"><txp:link_to_next><txp:next_title /></txp:link_to_next> &#8614;</div>
</txp:if_variable>
<div class="clear">&nbsp;</div>

</div>

<div class="grid_6" id="side" role="complementary">
<div id="meta">
<txp:if_custom_field name="venue">
<txp:if_custom_field name="venue" value="#">
<h4>Off line</h4>
<txp:else />
<p><a rel="external noopener" href="<txp:custom_field name="venue" escape="" />">Website</a></p>
</txp:if_custom_field>
<txp:else />
<p><a href="<txp:site_url />" rel="home">NeMe project</a></p>
</txp:if_custom_field>

<txp:if_custom_field name="type" value="call"><h3>Deadline</h3><txp:custom_field name="Dates" /></txp:if_custom_field>
<txp:if_custom_field name="Dates">
<txp:if_custom_field name="type" value="info"><h5>Date(s)</h5><txp:custom_field name="Dates" /></txp:if_custom_field>
<txp:else />
</txp:if_custom_field>
<h5>Posted</h5>
<time datetime="<txp:posted format="iso8601" />">
<txp:posted class="time-day" wraptag="span" format="%d" /> <txp:posted class="time-month" wraptag="span" format="%B" /> <txp:posted class="time-year" wraptag="span" format="%Y" />, <txp:posted class="time-time" wraptag="span" format="%T" />
</time>
</div>

<h3>Announcements</h3>

<txp:output_form form="announce" />

<txp:output_form form="social_logos" />

<div>
<h3>Latest Blog posts</h3>
<txp:article_custom section="blog" c10="" sort="posted desc" exclude='<txp:article_id />' limit="10" status="live" break="li" wraptag="ul">
<txp:permlink><txp:title /></txp:permlink>
</txp:article_custom>
</div></div>
