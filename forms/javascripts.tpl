<script defer="defer" src="http://www.neme.org/js/css3-mediaqueries.js"></script>
<!--[if (IE 6)|(IE 7)|(IE 8)]>
<script src="http://www.neme.org/js/html5shiv.js"></script>
<script src="http://www.neme.org/js/jquery1x.js"></script>
<![endif]-->
<!--[if gte IE 9]>
<script src="http://www.neme.org/js/jquery.js"></script>
<![endif]-->
<!--[if !IE]>-->
<script src="http://www.neme.org/js/jquery.js"></script>
<script>
$(function() {
$("li").removeClass("customTarget");
var myLocation = document.location.hash.replace("#","");
if (myLocation) {
document.getElementById(myLocation).className = "customTarget";
}
$("a").click(function () {
$("li").removeClass("customTarget");
var clickedLink = this.href.split("#");
if (clickedLink.length > 1) {
document.getElementById(clickedLink[1]).className = "customTarget";
}
});
});
</script>
<!--<![endif]-->

<script src="http://www.neme.org/js/responsiveslides.js"></script>
<script src="http://www.neme.org/js/bxslider.js"></script>

<script>
$(document).ready(function(){
// change class
$('body').removeClass('no-js').addClass('js');
// bxslider 
if(window.innerWidth < 960) {
$('.slider').bxSlider({
slideWidth: 600,
minSlides: 1,
maxSlides: 1,
moveSlides: 1,
slideMargin: 10
});
} else {
$('.slider').bxSlider({
slideWidth: 340,
minSlides: 2,
maxSlides: 2,
moveSlides: 2,
slideMargin: 10
});
}
// slides
$(".rslides").responsiveSlides({
auto: true,
speed: 500,
timeout: 4000,
pause: true,
pauseControls: true,
namespace: "rslides",
});
});
</script>


<txp:rvm_if_privileged><txp:else />
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
</txp:rvm_if_privileged>
