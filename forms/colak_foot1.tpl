<div id="footer" role="contentinfo"><div class="container_24">

<div class="grid_18" id="searchsites">
<txp:output_form form="colak-search" />
<txp:hide><txp:search_input match="any" /></txp:hide>
</div>

<div class="grid_6" id="copyright">
<p><a href="<txp:site_url />about/#disclaimer" rel="license">Disclaimer and privacy policy</a></p>
<p>On line for <txp:fha_time_diff year="2005" month="2" day="28" />.<br />
Valid <a href="http://validator.w3.org/check?uri=referer" rel="external">HTML5</a>, <a href="http://jigsaw.w3.org/css-validator/validator?uri=http%3A%2F%2Fwww.neme.org%2Fcss%2Fdefault.css&amp;profile=css3&amp;usermedium=all&amp;warning=1&amp;vextwarning=&amp;lang=en" rel="external">CSS</a>, <a href="http://feedvalidator.org/check.cgi?url=http://www.neme.org/rss/" rel="external">RSS</a>, <a href="http://feedvalidator.org/check.cgi?url=http://www.neme.org/atom/" rel="external">ATOM</a><txp:if_section name="">, <txp:hide><a href="http://www.contentquality.com/mynewtester/cynthia.exe?rptmode=-1&amp;url1=http%3A//www.neme.org/" rel="external"></txp:hide>508</txp:if_section><txp:if_individual_article>, <a href="http://www.contentquality.com/mynewtester/cynthia.exe?rptmode=-1&amp;url1=http%3A//www.neme.org<txp:page_url />" rel="external">508</a></txp:if_individual_article><br />
Hosted at <a rel="external" href="https://www.webfaction.com/?aid=87444"> Webfaction</a>.</p>
</div>

<div class="clear">&nbsp;</div>

</div><!-- end .container_24 --></div>

<script src="/themes/neme960/forms/js/html5shiv.js"></script>
<script defer="defer" src="/themes/neme960/forms/js/css3-mediaqueries.js"></script>
<!--[if (IE 6)|(IE 7)|(IE 8)]>
<script src="/themes/neme960/forms/js/jquery1x.js"></script>
<![endif]-->
<!--[if gte IE 9]>
<script src="/themes/neme960/forms/js/jquery.js"></script>
<![endif]-->
<!--[if !IE]>-->
<script src="/themes/neme960/forms/js/jquery.js"></script>
<!--<![endif]-->


<script src="/themes/neme960/forms/js/responsiveslides.js"></script>
<script src="/themes/neme960/forms/js/bxslider.js"></script>

<script>
$(document).ready(function(){
// change class
$('body').removeClass('no-js').addClass('js');
// bxslider 
  $(window).resize( function() {

    
if($(window).width() < 960) {
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
});
// slides
$(".rslides").responsiveSlides({
auto: true, // Boolean: Animate automatically, true or false
speed: 500, // Integer: Speed of the transition, in milliseconds
timeout: 5000, // Integer: Time between slide transitions, in milliseconds
// pager: false, // Boolean: Show pager, true or false
// nav: false, // Boolean: Show navigation, true or false
// random: false, // Boolean: Randomize the order of the slides, true or false
pause: true, // Boolean: Pause on hover, true or false
pauseControls: true, // Boolean: Pause when hovering controls, true or false
// prevText: "Previous", // String: Text for the "previous" button
// nextText: "Next", // String: Text for the "next" button
// maxwidth: "", // Integer: Max-width of the slideshow, in pixels
// navContainer: "", // Selector: Where controls should be appended to, default is after the 'ul'
// manualControls: "", // Selector: Declare custom pager navigation
namespace: "rslides", // String: Change the default namespace used
// before: function(){}, // Function: Before callback
// after: function(){} // Function: After callback
});
});
</script>

<txp:output_form form="colak_google" />
