<txp:header name="Cache-Control" value="no-cache, no-store, must-revalidate" />
<txp:if_logged_in group="publisher" not><txp:pat_speeder group="publisher" gzip="0"/></txp:if_logged_in>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">

<title>NeMe Linktree</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone=no">
<meta name="Robots" content="noindex,nocache,follow">
<meta name="GOOGLEBOT" content="NOARCHIVE">

<style>
body {background:#000;color:#fff;font-size:1.5em;line-height:1.2;font-family:'Helvetica Neue',Arial,'Liberation Sans',FreeSans,sans-serif;background-image: url("/images/2193.jpg");height: 1080px;background-position: right top;background-repeat: no-repeat; padding: 2em auto;}
h1 {font-size:1.3em;line-height:1}
h2,h3 {line-height:1.5em;margin-top:2em}
div {width:90%;max-width:450px;margin:1em auto;padding:0;display:block;}
div>p {background-color:#ba0000;border-radius:.3em;padding:.2em;}
div>p, h1, h2, h3, p {text-align: center;}
.video {aspect-ratio: 16 / 9;width: 100%;}
a {color:#f1f1f1;text-decoration: none;display: block;}
a:hover {cursor: pointer;}
footer p {margin:0 0 2em 0;}
.img {display:block;clear:both;width:100%;height:auto;max-width:300px;margin:2em auto;}
.logo {display:block;clear:both;width:100%;height:auto;max-width:80px;margin:2em auto;}
</style>
</head>
<body>

<div class="content">

<img src="<txp:page_url type="theme_path" />/forms/svg/neme_peace.svg" alt="NeMe logo" class="logo" width="50" height="50">

<h1>NeMe</h1>

<p><a rel="home" href="https://www.neme.org/">Home page</a></p>
<txp:if_logged_in group="publisher"><p><a rel="nofollow noopener" href="https://www.neme.org/textpattern/index.php?event=form&step=form_edit&name=linktree">Edit</a></p></txp:if_logged_in>

<h2>Calls &amp; Announcements</h2>
<txp:linklist category="active,ongoing" sort="id desc" limit="10" break="p" wraptag=""><txp:variable name="external noopener" value='<txp:link_description />' /><txp:if_variable name="external noopener" value="ext"><a href="<txp:link_url />" rel="external noopener"><txp:link_name escape="html" /></a><txp:else /><a href="<txp:link_url />"><txp:link_name escape="html" /></a></txp:if_variable></txp:linklist>

<h3>Social Media</h3>
<p><a rel="nofollow noopener" href="https://bsky.app/profile/nemeorg.bsky.social">Blue Sky</a></p>
<p><a rel="nofollow noopener" href="https://x.com/nemeorg/">X</a></p>
<p><a rel="nofollow noopener" href="https://instagram.com/nemeorg/">Instagram</a></p>
<p><a rel="nofollow noopener" href="https://www.facebook.com/nemeorg/">Facebook</a></p>
<p><a rel="nofollow noopener" href="https://youtube.com/@nemeorg">YouTube</a></p>
<p><a rel="nofollow noopener" href="https://vimeo.com/nemeorg/">Vimeo</a></p>
<p><a rel="nofollow noopener" href="https://mastodon.social/@nemeorg">Mastodon</a></p>

<h3>EU funded</h3>

<txp:linklist category="eu" sort="id desc" limit="10" break="p" wraptag=""><txp:variable name="external noopener" value='<txp:link_description />' /><txp:if_variable name="external noopener" value="ext"><a href="<txp:link_url />" rel="external noopener"><txp:link_name escape="html" /></a><txp:else /><a href="<txp:link_url />"><txp:link_name escape="html" /></a></txp:if_variable></txp:linklist>

</div>

<footer><p>&copy; 2004-<txp:date format="%Y" /> NeMe</p></footer>
</body>
</html>
