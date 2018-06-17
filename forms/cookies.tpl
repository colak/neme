<txp:if_logged_in>
<txp:else />
<!-- PW -->
<script>
  var _paq = _paq || [];
  /* tracker methods like "setCustomDimension" should be called before "trackPageView" */
  _paq.push(["setDocumentTitle", document.domain + "/" + document.title]);
  _paq.push(["setCookieDomain", "*.neme.org"]);
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u="//www.neme.org/piwik/";
    _paq.push(['setTrackerUrl', u+'piwik.php']);
    _paq.push(['setSiteId', '1']);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
  })();
</script>
<noscript><p><img src="/piwik/piwik.php?idsite=1&amp;rec=1&amp;bots=1" style="border:0;" alt="" /></p></noscript>
<!-- /PW -->
<script src="http://www.google-analytics.com/urchin.js">
</script>
<script>
_uacct = "UA-xxxxxx-x";
urchinTracker();
</script>

<script>
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-xxxxxx-x']);
_gaq.push(['_trackPageview']);
(function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';

var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
</script>
</txp:if_logged_in>
