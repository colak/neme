<txp:if_search not>
<script src="<txp:site_url />js/jquery3x.js"></script>
<txp:output_form form="responsiveslides.js" format="flat.script" />
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

<txp:output_form form="bxslider.js" format="flat.script" />

<script>
$(document).ready(function(){
// change class
$('body').removeClass('no-js').addClass('js');

// bxslider 
if(window.innerWidth < 960) {
$('.slider').bxSlider({
slideWidth: 340,
minSlides: 2,
maxSlides: 2,
moveSlides: 2,
slideMargin: 5
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
</txp:if_search>
