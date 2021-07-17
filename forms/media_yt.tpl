<txp:hide>YouTube</txp:hide>
	<txp:if_yield name="media">
		<txp:oui_cookie name='<txp:variable name="sitename" />_youtube' duration='<txp:variable name="cookielife" />' values="yes" />
			<txp:oui_if_cookie name='<txp:variable name="sitename" />_youtube'>
				<div class="embed-container<txp:if_yield name="class"> <txp:yield name="class" /></txp:if_yield>" id="m_<txp:yield name="media" />" itemscope itemtype="http://schema.org/VideoObject">
					<txp:if_yield name="url" value="pl"><iframe loading="lazy" src="https://www.youtube-nocookie.com/embed/videoseries?list=<txp:yield name="media" />" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen width="100%" height="auto"></iframe></txp:if_yield>
					<txp:if_yield name="url" value="user"><iframe loading="lazy" src="https://www.youtube-nocookie.com/embed?listType=user_uploads&amp;list=<txp:yield name="media" />" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></txp:if_yield>
					<txp:if_yield name="url" not><iframe loading="lazy" src="https://www.youtube-nocookie.com/embed/<txp:yield name="media" />" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></txp:if_yield>
				</div>
				<txp:if_logged_in>
					<txp:if_yield name="title" not>
						<txp:oui_if_cookie name='<txp:variable name="sitename" />_hide' not>
							<div class="gdpr">
								<txp:variable name="title" />
								<p class="accept red centre"><a rel="nofollow noindex noodp noydir noarchive nocache" href="?<txp:variable name="sitename" />_hide=yes">Hide warnings for 30 minutes</a></p>
							</div>
						</txp:oui_if_cookie>
					</txp:if_yield>
				</txp:if_logged_in>
			<txp:else />
				<div class="gdpr <txp:if_yield name="class"> <txp:yield name="class" /></txp:if_yield>">
					<txp:if_yield name="0" not>
						<txp:if_yield name="img">
							<txp:variable name="img" />
						<txp:else />
							<txp:if_yield name="url" not>
								<img loading="lazy" srcset="https://i3.ytimg.com/vi/<txp:yield name="media" />/hqdefault.jpg 480w, https://i3.ytimg.com/vi/<txp:yield name="media" />/maxresdefault.jpg 1280w" sizes="(max-width: 600px) 480px, 960px" src="https://i3.ytimg.com/vi/<txp:yield name="media" />/hqdefault.jpg" alt="<txp:yield name="title" escape="textile, tags" default="External video still" />" itemscope itemtype="http://schema.org/ImageObject" />
							</txp:if_yield>
						</txp:if_yield>
					</txp:if_yield>
					<txp:if_yield name="title">
						<txp:yield name="title" escape="textile" />
					<txp:else />
						<txp:if_logged_in><txp:variable name="title" /></txp:if_logged_in>
					</txp:if_yield>
					<p>Hosted by YouTube on 
						<a rel="external noopener" href="<txp:if_yield name="url" value="pl">https://www.youtube.com/playlist?list=<txp:else />https://youtu.be/</txp:if_yield><txp:yield name="media" />"><txp:if_yield name="url" value="pl">https://www.youtube.com/playlist?list=<txp:else />youtu.be/</txp:if_yield><txp:yield name="media" /></a>.</p>
					<p class="accept red centre"><a rel="nofollow noindex noodp noydir noarchive nocache" href="?<txp:variable name="sitename" />_youtube=yes#m_<txp:yield name="media" />">Watch here</a></p>
					<p class="licence"><a rel="external noopener licence" href="https://youtube.com/privacy">YouTube&#8217;s privacy policy</a>.</p>
				</div>
			</txp:oui_if_cookie>
	</txp:if_yield>
