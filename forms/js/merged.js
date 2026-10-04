// detect js
document.addEventListener("DOMContentLoaded", function() {
    document.body.classList.remove("no-js");
    document.body.classList.add("js")
});

// top nav
function myNav() {
    var a = document.getElementById("myTopnav");
    if (a.className === "topnav") a.className += " responsive";
    else a.className = "topnav"
}

// slides
var slides = document.querySelectorAll("#slides .slide"),
    currentSlide = 0,
    slideInterval = setInterval(nextSlide, 3500);

function nextSlide() {
    slides[currentSlide].className = "slide";
    currentSlide = (currentSlide + 1) % slides.length;
    slides[currentSlide].className = "slide showing"
}

function startSlideshow() {
    slideInterval = setInterval(nextSlide, 3500)
}

function pauseSlideshow() {
    clearInterval(slideInterval)
}
document.querySelector("#slides").addEventListener("mouseover", pauseSlideshow);
document.querySelector("#slides").addEventListener("mouseout", startSlideshow);