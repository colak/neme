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
