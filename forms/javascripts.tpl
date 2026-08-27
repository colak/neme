<script>document.addEventListener("DOMContentLoaded",(function(){document.body.className=document.body.className.replace(/\bno-js\b/,"js")}));</script>
<txp:if_search not><txp:output_form form="carousel.js" format="flat.script" />
<txp:if_section name="projects"><script>"open"in document.createElement("details")||import("<txp:output_form form="details_tag.js" format="flat.url" />").then(l=>{console.log("Legacy accordion polyfill loaded successfully.")}).catch(l=>console.error("Failed to load polyfill:",l));</script></txp:if_section></txp:if_search>
