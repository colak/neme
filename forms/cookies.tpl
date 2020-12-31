<txp:oui_cookie name="accept_cookies" duration="+1 year" values="yes" />

<txp:oui_if_cookie name="accept_cookies">
<txp:if_logged_in>
<txp:else />
<script src="https://www.google-analytics.com/urchin.js"></script>
<script>
_uacct = "UA-219344-1";
urchinTracker();
</script>
<script>
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-219344-1']);
_gaq.push (['_gat._anonymizeIp']);
_gaq.push(['_trackPageview']);
(function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
</script>
</txp:if_logged_in>
<txp:else />
<!--googleoff: all-->
<div id="eucookies" class="noprint cookies">
<div class="container_24 noprint">
<div class="grid_18 noprint">
<h3>We value your privacy</h3>
<p>To make sure that this website remains accessible in the European Union, we are forced to include this superfluous notice to inform you that this website, like most of the websites in the world, works best with <a rel="canonical" href="/about/cookies">cookies</a>. We do not profile you or use the data for any commercial purposes except to study ways to enhance user experience in ours sites. We hope that you are happy with that, and that you will help us continue this research by <a rel="nofollow" href="?accept_cookies=yes">accepting our cookies</a> but, unlike with other websites,  surfing our site in privacy is still possible should you decide not to. You can find out more about our use of cookies by reading our <a rel="nofollow" href="<txp:site_url />about/privacy-policy">privacy policy</a>.</p>
</div>
<div class="grid_6 noprint"><p><a rel="nofollow noindex noodp noydir" href="?accept_cookies=yes">Accept</a></p></div>
<div class="clear">&nbsp;</div>
</div>
</div>
</txp:oui_if_cookie>
<!--googleon: all-->
