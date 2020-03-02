<txp:act_if_mobile>
<txp:else />
<form action="<txp:php> echo $_SERVER['PHP_SELF'];</txp:php>" id="search" method="post"  class="nosmall" role="search" itemscope itemtype="https://schema.org/SearchAction">
<fieldset>
<legend>Search</legend>
<input type="hidden" value="any" name="m" />
<label for="site">Site
<select id="site" name="site">
<txp:php>
// simple way to auto-generate <options>
$sites = array(
// site title => url/?q=
'NeMe' => '<txp:site_url />?m=any&amp;q=',
'Respublika' => 'http://respublika.neme.org/?m=any&amp;q=',
'Forum' => '<txp:site_url />search.php?action=search&amp;keywords=',
);
// asort($sites);
foreach ($sites as $title => $url) {
echo '<option value="'.$url.'">'.$title.'</option>';
};

</txp:php>
</select>
</label>

<label class="accessibility hidden" for="terms" aria-hidden="false">Search</label>
<input id="terms" name="terms" type="text" value="<txp:page_url type="q" />" itemprop="query-input" placeholder="Search"/>


<input name="submit" type="submit" value="search" id="searchbutton" />
</fieldset>
</form>
</act_if_mobile>
<p><txp:if_article_list>

<txp:if_section name="nac">
&copy; 2014-<txp:php>echo safe_strftime("%Y");</txp:php> <a href="<txp:site_url />">NeMe</a>.
<txp:else />
<txp:if_section name="about,projects,texts">
&copy; 2004-<txp:php>echo safe_strftime("%Y");</txp:php> <a href="<txp:site_url />">NeMe</a> and/or respective contributors.
<txp:else />
<txp:if_section name="blog">
2004-<txp:php>echo safe_strftime("%Y");</txp:php> The content in the <a href="/blog/">Blog</a> section of this site is licensed under a <a rel="external" href="https://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0</a> International license.
<txp:else />
&copy; 2004-<txp:php>echo safe_strftime("%Y");</txp:php> <a href="<txp:site_url />">NeMe</a>.
</txp:if_section>
</txp:if_section>
</txp:if_section>
<txp:else />

<txp:variable name="year" value='<txp:php>echo safe_strftime("%Y");</txp:php>' />

<txp:if_article_section name="texts">
<txp:variable name="textauthor"><txp:linklist id='<txp:custom_field name="venue" escape="" />' break=" &amp; " wraptag=""><span itemscope itemtype="http://schema.org/Text"><span itemprop="author"><txp:link_name /></span></span></txp:linklist></txp:variable>

<txp:if_variable name="year" value='<txp:posted format="%Y" />'>
&copy; 2004-<txp:php>echo safe_strftime("%Y");</txp:php> <a href="<txp:site_url />">NeMe</a> &bull; Text &copy; <txp:variable name="year" /> <txp:variable name="textauthor" />
<txp:else />
&copy; 2004-<txp:php>echo safe_strftime("%Y");</txp:php> <a href="<txp:site_url />">NeMe</a> &bull; Text &copy; <txp:posted format="%Y" />-<txp:variable name="year" /> <txp:variable name="textauthor" />
</txp:if_variable>

<txp:else />

<txp:if_variable name="year" value='<txp:posted format="%Y" />'>
&copy; <txp:variable name="year" /> <a href="<txp:site_url />">NeMe</a> and/or respective contributors.
<txp:else />
&copy; <txp:posted format="%Y" />-<txp:variable name="year" /> <a href="<txp:site_url />">NeMe</a> and/or respective contributors.
</txp:if_variable>

</txp:if_article_section>

<txp:if_article_section name="blog">
2004-<txp:php>echo safe_strftime("%Y");</txp:php> The content in the <a href="/blog/">Blog</a> section of this site is licensed under a <a rel="external" href="https://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0</a> International license.


</txp:if_article_section>

</txp:if_article_list></p>
<txp:hide><script src="<txp:page_url type="theme_path" />/forms/javascripts/main.js"></script></txp:hide>
