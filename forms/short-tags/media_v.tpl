<txp:hide>Vimeo</txp:hide>
	<txp:if_yield name="media">
		<txp:oui_cookie name='<txp:variable name="sitename" />_vimeo' duration='<txp:variable name="cookielife" />' values="yes" />
			<txp:oui_if_cookie name='<txp:variable name="sitename" />_vimeo'>
				<div class="embed-container" id="m_<txp:yield name="media" />" itemscope itemtype="http://schema.org/VideoObject">
					<txp:if_yield name="url" value="a">
						<iframe loading="lazy" src='https://vimeo.com/showcase/<txp:yield name="media" />/embed' allowfullscreen frameborder='0' style='position:absolute;top:0;left:0;width:100%;height:100%;'></iframe>
					</txp:if_yield>
					<txp:if_yield name="url" value="vr">
						<iframe loading="lazy" src="https://player.vimeo.com/video/<txp:yield name="media" />" width="640" height="360" frameborder="0" allow="autoplay; fullscreen; gyroscope; accelerometer" allowfullscreen></iframe>
					</txp:if_yield>
					<txp:if_yield name="url" not>
						<iframe loading="lazy" src="https://player.vimeo.com/video/<txp:yield name="media" />?title=0&amp;byline=0&amp;portrait=0" allowfullscreen></iframe>
					</txp:if_yield>
				</div>
				<txp:if_logged_in>
					<txp:if_yield name="title" not>
						<txp:oui_if_cookie name='<txp:variable name="sitename" />_hide' not>
							<div class="theylive">
								<txp:variable name="title" />
								<p class="accept"><a rel="nofollow noindex noodp noydir noarchive nocache" href="?<txp:variable name="sitename" />_hide=yes">Hide warnings for 30 minutes</a></p>
							</div>
						</txp:oui_if_cookie>
					</txp:if_yield>
				</txp:if_logged_in>
			<txp:else />
				<div class="theylive">
					<txp:etc_query url='https://vimeo.com/api/oembed.json?url=http%3A//vimeo.com/<txp:yield name="media" />' query="." markup="json">
   						<img src="{thumbnail_url?}" width="{thumbnail_width?}" height="{thumbnail_height?}" class="grid_24" alt="{description?}">
    						<txp:hide>{description?}</txp:hide>
					</txp:etc_query>
					<txp:if_yield name="title">
						<txp:yield name="title" escape="textile" />
					<txp:else />
						<txp:if_logged_in><txp:variable name="title" /></txp:if_logged_in>
					</txp:if_yield>
					<p>Hosted by Vimeo on<br><a rel="external noopener" href="https://vimeo.com/<txp:yield name="media" />">vimeo.com/<txp:yield name="media" /></a>.</p>
					<p class="licence"><a rel="external noopener licence" href="https://vimeo.com/privacy">Vimeo&#8217;s privacy policy</a>.</p>
					<p class="accept"><a rel="nofollow noindex noodp noydir noarchive nocache" href="?<txp:variable name="sitename" />_vimeo=yes#m_<txp:yield name="media" />">View it here</a></p>
				</div>
			</txp:oui_if_cookie>
	</txp:if_yield>
