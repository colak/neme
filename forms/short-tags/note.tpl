<txp:if_yield name="pos" value="top">
<sup class="tooltip"><a href="#fn<txp:yield name="no" />" id="foot<txp:yield name="no" />"><txp:yield name="no" /></a>
<span class="tooltiptext noprint" <txp:if_yield name="lang">lang='<txp:yield name="lang" />'</txp:if_yield>><txp:variable name='text<txp:yield name="no" />'><txp:yield name="txt" escape="" /></txp:variable><txp:yield name="txt" escape="" /></span></sup></txp:if_yield>

<txp:if_yield name="pos" value="bottom">
<li id="fn<txp:yield name="no" />"><txp:if_yield name="txt"><txp:yield name="txt" escape="" />
<txp:else />
<txp:variable name='text<txp:yield name="no" />' /></txp:if_yield> <span class="noprint"><a href="#foot<txp:yield name="no" />">&#8679;</a></span></li>
</txp:if_yield>
