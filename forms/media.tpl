<txp:hide> 
The latest source code, explanations, and examples on how to use this shortcode can be found on 
https://github.com/colak/txp-media-shortcode
</txp:hide>

<txp:hide>Change with a prefix you prefer. Default is the site name</txp:hide>
<txp:variable name="sitename"><txp:site_name trim="/\s+/" replace="_" /></txp:variable>

<txp:hide>Hide warnings visible only to logged in users. Change the duration below to the one you prefer between warnings. A duration under +1 hour is recommended</txp:hide>
<txp:oui_cookie name='<txp:variable name="sitename" />_hide' duration="+30 minutes" values="yes" />

<txp:hide>Cookie life. Change the duration below to the one you prefer between warnings to a duration of up to +1 year. +3 months is recommended</txp:hide>
<txp:variable name="cookielife">+1 year</txp:variable>

<txp:hide>Common variables</txp:hide>
<txp:variable name="title"><p class="error">Warning: <b>title</b> is a recommended attribute.</p></txp:variable>

<txp:hide>Please keep the code below as is, although the default alt atribute could change.</txp:hide>
<txp:variable name="img"><txp:images id='<txp:yield name="img" />'><img itemscope itemtype="http://schema.org/ImageObject" loading="lazy" src="<txp:site_url />images/<txp:yield name="img" /><txp:image_info type="ext" />" widh="<txp:image_info type="w" />" height="<txp:image_info type="h" />" alt="<txp:image_info type="alt" default="External media preview image" />" /></txp:images></txp:variable>

<txp:hide>Check if form, called by the 'from' attribute, exists. Note that when the form does not exist, this code shows errors to not logged in users when the site is on Debug mode. On live mode, the errors are only visible when logged in.</txp:hide>
<txp:evaluate>
	<txp:output_form form='media_<txp:yield name="from" />' />
<txp:else />
	<txp:if_logged_in>
		<div class="gdpr"><p class="error">Error: There is no <b><txp:yield name="from" /></b> host using the <b>from</b> attribute.</p></div>
	</txp:if_logged_in>
</txp:evaluate>
