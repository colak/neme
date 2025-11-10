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

<txp:if_article_section name="projects"><txp:oui_if_cookie name="_NeMe_vimeo">
<txp:output_form form="bxslider.js" format="flat.script" />
</txp:oui_if_cookie></txp:if_article_section>

<script>
$(document).ready(function(){
// change class
$('body').removeClass('no-js').addClass('js');

<txp:if_article_section name="projects"><txp:oui_if_cookie name="_NeMe_vimeo">
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
</txp:oui_if_cookie></txp:if_article_section>
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
