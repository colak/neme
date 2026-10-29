document.addEventListener("DOMContentLoaded", () => {
  const carousel = document.querySelector(".carousel");
  if (!carousel) return;

  const slides = Array.from(carousel.querySelectorAll("li"));
  if (slides.length === 0) {
    console.error("Carousel items not found");
    return;
  }

  let currentIndex = 0;
  let touchStartX = 0;
  let intervalId = null;

  let isHoverPaused = false;
  let isTouchActive = false;

  function canAdvance() {
    return !isHoverPaused && !isTouchActive;
  }

  function updateSlideAccessibility() {
    slides.forEach((slide, index) => {
      const isActive = index === currentIndex;

      slide.classList.toggle("active", isActive);
      slide.classList.toggle("inactive", !isActive);

      if (isActive) {
        slide.removeAttribute("aria-hidden");
      } else {
        slide.setAttribute("aria-hidden", "true");
      }
    });
  }

  function goToSlide(direction, isAutoPlayCall = false) {
    if (isAutoPlayCall && !canAdvance()) return;

    currentIndex = (currentIndex + direction + slides.length) % slides.length;
    updateSlideAccessibility();
  }

  function nextSlide(isAutoPlayCall = false) {
    goToSlide(1, isAutoPlayCall);
  }

  function prevSlide() {
    goToSlide(-1, false); // Manual actions skip interaction blocks
  }

  function startAutoPlay() {
    clearInterval(intervalId);
    intervalId = setInterval(() => {
      nextSlide(true); // Pass true to specify this run is a background automation loop
    }, 4500);
  }

  function pauseAutoPlay() {
    isHoverPaused = true;
    clearInterval(intervalId);
  }

  function resumeAutoPlay() {
    isHoverPaused = false;
    startAutoPlay();
  }

  updateSlideAccessibility();

  const slidesWrapper = document.querySelector(".slides");
  if (slidesWrapper) {
    slidesWrapper.addEventListener("mouseenter", pauseAutoPlay);
    slidesWrapper.addEventListener("mouseleave", resumeAutoPlay);

    slidesWrapper.addEventListener("click", (e) => {
      if (e.pointerType === "touch") return;

      const rect = carousel.getBoundingClientRect();
      const clickX = e.clientX - rect.left;

      if (clickX < rect.width / 2) {
        prevSlide();
      } else {
        nextSlide(false);
      }
    });

    slidesWrapper.addEventListener(
      "touchstart",
      (e) => {
        isTouchActive = true;
        clearInterval(intervalId);
        touchStartX = e.changedTouches[0].clientX;
      },
      { passive: true }
    );

    slidesWrapper.addEventListener(
      "touchend",
      (e) => {
        const touchEndX = e.changedTouches[0].clientX;
        const swipeDistance = touchEndX - touchStartX;

        isTouchActive = false;

        if (swipeDistance > 50) {
          prevSlide();
        } else if (swipeDistance < -50) {
          nextSlide(false);
        } else {
          const rect = carousel.getBoundingClientRect();
          const tapX = touchEndX - rect.left;

          if (tapX < rect.width / 2) {
            prevSlide();
          } else {
            nextSlide(false);
          }
        }

        startAutoPlay();
      },
      { passive: true }
    );
  }

  document.addEventListener("keydown", (e) => {
    const carouselFocused =
      e.target.closest?.(".slides") ||
      document.activeElement?.closest?.(".slides");

    if (!carouselFocused) return;

    if (e.key === "ArrowLeft") {
      prevSlide();
    } else if (e.key === "ArrowRight") {
      nextSlide(false);
    }
  });

  startAutoPlay();
});
