<txp:variable name="static_sections">workshops,nac</txp:variable>

<div class="line">
<txp:if_article_section name="about">

<txp:if_article_id id="1">
<h3 class="entry-title"><a href="<txp:site_url />about/">About</a></h3>
<p class="entry-summary"><txp:search_result_excerpt /></p>
<p class="small"><a href="<txp:site_url />about/"><txp:site_url />about/</a></p>

<txp:else />
<h3 class="entry-title"><txp:permlink><txp:title /></txp:permlink></h3>
<p class="entry-summary"><txp:search_result_excerpt /></p>
<p class="small"><txp:permlink><txp:permlink /></txp:permlink></p>
</txp:if_article_id>

<txp:else />

<txp:if_article_section name='<txp:variable name="static_sections />'>
<h3 class="entry-title"><a href="<txp:site_url /><txp:section />/"><txp:section title="1" /></a></h3>
<p class="entry-summary"><txp:search_result_excerpt /></p>
<p class="small"><a href="<txp:site_url /><txp:section />/"><txp:site_url /><txp:section />/</a></p>

<txp:else />

<h3 class="entry-title"><txp:permlink><txp:title /></txp:permlink></h3>
<p class="entry-summary"><txp:search_result_excerpt /></p>
<p class="small"><txp:permlink><txp:permlink /></txp:permlink></p>
</txp:if_article_section>

</txp:if_article_section>
</div>
