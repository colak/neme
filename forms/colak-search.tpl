<txp:act_if_mobile not>
<form action="<txp:php> echo $_SERVER['PHP_SELF'];</txp:php>" id="search" method="post"  class="nosmall" role="search" itemscope itemtype="https://schema.org/SearchAction">
<fieldset>
<legend>Search</legend>
<input type="hidden" value="all" name="m">
<label for="site">Site
<select id="site" name="site">
<txp:php>
// simple way to auto-generate <options>
$sites = array(
// site title => url/?q=
'NeMe' => 'https://www.neme.org?m=all&amp;q=',
'A Sea Change' => 'https://a-sea-change.net/search/?q=',
'Toolkit of Care' => 'https://toolkitof.care/?m=any&amp;q='
);
// asort($sites);
foreach ($sites as $title => $url) {
echo '<option value="'.$url.'">'.$title.'</option>';
};

</txp:php>
</select>
</label>

<label class="accessibility hidden" for="terms">Search</label>
<input id="terms" name="terms" type="text" value="<txp:page_url type="q" />" itemprop="query-input" placeholder="Search">


<input name="submit" type="submit" value="search" id="searchbutton">
</fieldset>
</form>
</txp:act_if_mobile>


<txp:hide><script src="<txp:page_url type="theme_path" />/forms/javascripts/main.js"></script></txp:hide>
