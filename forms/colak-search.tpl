<form action="<txp:php> echo $_SERVER['PHP_SELF'];</txp:php>" id="search" method="post"  class="nosmall">
<fieldset>
<legend>Search</legend>
<input type="hidden" value="any" name="m" />
<label for="site">Site
<select id="site" name="site">
<txp:php>
// simple way to auto-generate <options>
$sites = array(
// site title => url/?q=
'NeMe' => 'http://www.neme.org/?m=any&amp;q=',
'News' => 'http://news.neme.org/?m=any&amp;q=',
'Forum' => 'http://forum.neme.org/search.php?action=search&amp;keywords=',
);
// asort($sites);
foreach ($sites as $title => $url) {
echo '<option value="'.$url.'">'.$title.'</option>';
};

</txp:php>
</select>
</label>
<label for="terms">Terms
<input id="terms" name="terms" type="text" value="<txp:page_url type="q" />"/>
</label>

<input name="submit" type="submit" value="search" id="searchbutton" />
</fieldset>
</form>
<p>&copy; 2004-<txp:php>echo date('Y');</txp:php> <a href="http://www.neme.org">NeMe</a> &bull; <txp:if_article_section name="texts"> Text &copy; <txp:posted format="%Y" />-<txp:php>echo date('Y');</txp:php> <txp:linklist id='<txp:custom_field name="venue" escape="" />' break=" &amp; " wraptag=""><span itemscope itemtype="http://schema.org/Text"><span itemprop="author"><txp:link_name /></span></span></txp:linklist><txp:else />and/or respective contributors</txp:if_article_section></p>
<txp:hide><a href="https://twitter.com/share" class="twitter-share-button" data-via="NeMeOrg" data-size="large" data-hashtags="arts">Tweet</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script></txp:hide>
<script defer src="http://www.neme.org/js/default.js"></script>
