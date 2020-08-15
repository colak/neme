<txp:if_yield name="caption">
<figure<txp:if_yield name="class"> class="<txp:yield name="class" />"</txp:if_yield>>
<txp:images id='<txp:yield name="id" />'><img itemscope itemtype="http://schema.org/ImageObject" loading="lazy" src="/images/<txp:yield name="id" /><txp:image_info type="ext" />" width="<txp:image_info type="w" />" height="<txp:image_info type="h" />" alt="<txp:image_info type="alt" default="Image at NeMe" />" />" /></txp:images>
<figcaption class="grid_24"><txp:yield name="caption" escape="tidy,textile" /></figcaption>
</figure>
<txp:else />
<txp:images id='<txp:yield name="id" />'><img itemscope itemtype="http://schema.org/ImageObject" loading="lazy" src="/images/<txp:yield name="id" /><txp:image_info type="ext" />" width="<txp:image_info type="w" />" height="<txp:image_info type="h" />" alt="<txp:image_info type="alt" default="Image at NeMe" />" class="<txp:yield name="class" default="image" />" /></txp:images>
</txp:if_yield>
