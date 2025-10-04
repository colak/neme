<txp:hide>YouTube</txp:hide>
	<txp:if_yield name="media">
		<txp:oui_cookie name='<txp:variable name="sitename" />_youtube' duration='<txp:variable name="cookielife" />' values="yes" />
			<txp:oui_if_cookie name='<txp:variable name="sitename" />_youtube'>
				<div class="embed-container <txp:yield name="class" default="if169" />" id="m_<txp:yield name="media" />" itemscope itemtype="http://schema.org/VideoObject">
					<txp:if_yield name="url" value="pl"><iframe class="<txp:yield name="class" default="if169" />" loading="lazy" referrerpolicy="strict-origin-when-cross-origin" src="https://www.youtube-nocookie.com/embed/videoseries?list=<txp:yield name="media" />" allow="autoplay; encrypted-media; gyroscope; picture-in-picture, web-share" allowfullscreen style="width:100%; height:100%"></iframe></txp:if_yield>
					<txp:if_yield name="url" value="user"><iframe class="<txp:yield name="class" default="if169" />" loading="lazy" referrerpolicy="strict-origin-when-cross-origin" style="width:100%; height:100%" src="https://www.youtube-nocookie.com/embed?listType=user_uploads&amp;list=<txp:yield name="media" />" allow="autoplay; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe></txp:if_yield>
					<txp:if_yield name="url" not><iframe loading="lazy" referrerpolicy="strict-origin-when-cross-origin" class="<txp:yield name="class" default="if169" />" src="https://www.youtube-nocookie.com/embed/<txp:yield name="media" />" allow="autoplay; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe></txp:if_yield>
				</div>
				<txp:if_logged_in>
					<txp:if_yield name="title" not>
						<txp:oui_if_cookie name='<txp:variable name="sitename" />_hide' not>
							<div class="theylive">
								<txp:variable name="title" />
								<p class="accept red centre"><a rel="nofollow noindex noodp noydir noarchive nocache" href="?<txp:variable name="sitename" />_hide=yes">Hide warnings for 30 minutes</a></p>
							</div>
						</txp:oui_if_cookie>
					</txp:if_yield>
				</txp:if_logged_in>
			<txp:else />
				<div class="theylive<txp:if_yield name="class"> <txp:yield name="class" /></txp:if_yield>">
						<txp:etc_query url='https://www.youtube.com/oembed?url=http%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3D<txp:yield name="media" />&format=json' query="." markup="json">
						   	<img loading="lazy" src="{thumbnail_url?}" width="{thumbnail_width?}" height="{thumbnail_height?}" alt="Video poster frame">
						</txp:etc_query>
						<txp:if_yield name="title">
						<txp:yield name="title" escape="textile" />
					<txp:else />
						<txp:if_logged_in><txp:variable name="title" /></txp:if_logged_in>
					</txp:if_yield>
					<p class="clearboth">Hosted by YouTube on<br>
						<a rel="external noopener" href="<txp:if_yield name="url" value="pl">https://www.youtube.com/playlist?list=<txp:else />https://youtu.be/</txp:if_yield><txp:yield name="media" />"><txp:if_yield name="url" value="pl">youtube.com/playlist?list=<txp:else />youtu.be/</txp:if_yield><txp:yield name="media" /></a>.</p>
					<p class="accept red centre"><a rel="nofollow noindex noodp noydir noarchive nocache" href="?<txp:variable name="sitename" />_youtube=yes#m_<txp:yield name="media" />">Watch here</a></p>
					<p class="licence"><a rel="external noopener licence" href="https://youtube.com/privacy">YouTube&#8217;s privacy policy</a>.</p>
					<p>Note that you may have to refresh your browser if you get a YouTube error after accepting the cookie.<p>
				</div>
			</txp:oui_if_cookie>
	</txp:if_yield>
