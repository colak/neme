<txp:if_article_id id="2001">
	<div class="line">
		<h3 class="entry-title"><a href="<txp:site_url />about/">About</a></h3>
		<p class="entry-summary"><txp:search_result_excerpt /></p>
		<p class="small"><a href="<txp:site_url />about/"><txp:site_url />about/</a></p>
	</div>
<txp:else />
	<div class="line">
		<h3 class="entry-title"><txp:permlink><txp:title /></txp:permlink></h3>
		<p class="entry-summary"><txp:search_result_excerpt /></p>
		<p class="small"><txp:permlink><txp:permlink /></txp:permlink></p>
	</div>
</txp:if_article_id>
