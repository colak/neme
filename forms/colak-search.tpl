<form action="<txp:php> echo $_SERVER['PHP_SELF'];</txp:php>" id="search" method="post" role="search" itemscope itemtype="https://schema.org/SearchAction" toolname="cross_network_cultural_search" tooldescription="Queries archival nodes across three distinct contemporary art and media research networks: NeMe (<txp:article_custom section="projects,about,blog,texts,publications" pageby="1" pgonly escape="number" /> posts), A Sea Change (Mediterranean ecological art), and Toolkit of Care (critical support networks).">
      
<fieldset>
<legend>Search</legend>
<input type="hidden" value="all" name="m">

<label for="site">Site
<select id="site" name="site" toolparamtitle="target_network_url" toolparamdescription="The base system URL endpoint for the target network repository. Must match one of the exact string values from the option configuration.">
<txp:php>
$sites = array(
  'NeMe' => 'https://www.neme.org?m=all&amp;q=',
  'A Sea Change' => 'https://a-sea-change.net/search/?q=',
  'Toolkit of Care' => 'https://toolkitof.care/?m=any&amp;q='
);
foreach ($sites as $title => $url) {
  echo '<option value="'.$url.'">'.$title.'</option>';
};
</txp:php>
</select>
</label>

<label class="accessibility hidden" for="terms">Search</label>
<input id="terms" name="terms" type="text" value="<txp:page_url type="q" />" itemprop="query-input" placeholder="Search" toolparamtitle="query" toolparamdescription="The specific search keyword, artist name, project timeline parameter, or cultural theory concept to scan across the selected repository.">

<txp:hide><txp:search_input match="all" /></txp:hide>
<input name="submit" type="submit" value="search" id="searchbutton">
</fieldset>
</form>
