<script>document.addEventListener("DOMContentLoaded",(function(){document.body.className=document.body.className.replace(/\bno-js\b/,"js")}));</script>
<txp:output_form form="menu.js" format="flat.script" />
<txp:if_search not>
<txp:if_article_list>
<txp:if_section name="about,projects,texts,">
<txp:output_form form="carousel.js" format="flat.script" />
</txp:if_section>
<txp:else /><txp:hide>individual articles</txp:hide>
<txp:if_article_section name="about">
<txp:if_article_id id="2044,2002,2241">
<txp:output_form form="carousel.js" format="flat.script" />
</txp:if_article_id>
</txp:if_article_section>
<txp:if_article_section name="projects">
<txp:output_form form="carousel.js" format="flat.script" />
<script>"open"in document.createElement("details")||import("<txp:output_form form="details_tag.js" format="flat.url" />").then(l=>{console.log("Legacy accordion polyfill loaded successfully.")}).catch(l=>console.error("Failed to load polyfill:",l));</script>
</txp:if_article_section>
<txp:if_article_section name="publications">
<txp:output_form form="tabs.js" format="flat.script" />
</txp:if_article_section>
</txp:if_article_list>
</txp:if_search>
