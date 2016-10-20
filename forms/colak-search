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
<p>&copy; 2004-<txp:php>echo date('Y'); </txp:php>, <a href="<txp:site_url />">NeMe</a> and/or respective contributors</p>
<script defer src="<txp:site_url />js/default.js"></script>
