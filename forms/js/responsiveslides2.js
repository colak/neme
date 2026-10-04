/*! http://responsiveslides.com v1.55 by @viljamis */

(function(window, document, undefined) {
  // Define the plugin function
  function responsiveSlides(element, options) {
    // Default options
    var defaults = {
      auto: true,
      speed: 500,
      timeout: 4000,
      pager: false,
      nav: false,
      random: false,
      pause: false,
      pauseControls: true,
      prevText: "Previous",
      nextText: "Next",
      maxwidth: "",
      navContainer: "",
      manualControls: "",
      namespace: "rslides",
      before: function() {},
      after: function() {}
    };

    var settings = Object.assign({}, defaults, options);
    var container = element;
    var slides = container.children;
    var currentSlide = 0;
    var slideCount = slides.length;
    var transitionSupported = (function() {
      var style = document.body.style;
      return (
        "transition" in style ||
        "WebkitTransition" in style ||
        "MozTransition" in style ||
        "KhtmlTransition" in style ||
        "OTransition" in style
      );
    })();

    var autoInterval = null;

    // Assign IDs to slides
    Array.prototype.forEach.call(slides, function(slide, index) {
      slide.id = settings.namespace + index;
    });

    // Add classes and initial styles
    container.classList.add(settings.namespace);
    var namespace = settings.namespace;

    if (settings.maxwidth) {
      container.style.maxWidth = settings.maxwidth + "px";
    }
    // Show only the first slide
    Array.prototype.forEach.call(slides, function(slide, index) {
      slide.style.display = index === 0 ? "block" : "none";
    });
    slides[0].classList.add(namespace + "_here");

    // Function to go to a specific slide
    function goToSlide(index) {
      if (index < 0 || index >= slideCount) return;
      settings.before(index);
      Array.prototype.forEach.call(slides, function(slide, i) {
        if (i === index) {
          slide.style.display = "block";
          slide.classList.add(namespace + "_here");
        } else {
          slide.style.display = "none";
          slide.classList.remove(namespace + "_here");
        }
      });
      currentSlide = index;
      settings.after(index);
    }

    // Randomize slides if needed
    if (settings.random) {
      slides = Array.prototype.slice.call(slides);
      for (let i = slides.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [slides[i], slides[j]] = [slides[j], slides[i]];
      }
      // Reorder in DOM
      slides.forEach(function(slide) {
        container.appendChild(slide);
      });
    }

    // Set up pager
    var pagerContainer;
    var pager;
    if (settings.pager || settings.manualControls) {
      pagerContainer = document.createElement("ul");
      pagerContainer.className = namespace + "_tabs " + namespace + "_tabs";
      if (settings.navContainer) {
        var navContainer = document.querySelector(settings.navContainer);
        if (navContainer) {
          navContainer.appendChild(pagerContainer);
        }
      } else {
        container.parentNode.insertBefore(pagerContainer, container.nextSibling);
      }

      for (let i = 0; i < slideCount; i++) {
        const li = document.createElement("li");
        const a = document.createElement("a");
        a.href = "#";
        a.className = namespace + "_tabs " + namespace + "_" + (i + 1);
        a.textContent = i + 1;
        li.appendChild(a);
        pagerContainer.appendChild(li);
      }

      pager = Array.prototype.slice.call(pagerContainer.querySelectorAll("a"));

      pager.forEach(function(p, index) {
        p.addEventListener("click", function(e) {
          e.preventDefault();
          if (settings.pauseControls) {
            clearInterval(autoInterval);
          }
          goToSlide(index);
        });
      });
    }

    // Setup navigation
    if (settings.nav) {
      const prevBtn = document.createElement("a");
      prevBtn.href = "#";
      prevBtn.className = namespace + "_nav " + namespace + "_prev";
      prevBtn.textContent = settings.prevText;

      const nextBtn = document.createElement("a");
      nextBtn.href = "#";
      nextBtn.className = namespace + "_nav " + namespace + "_next";
      nextBtn.textContent = settings.nextText;

      if (settings.navContainer) {
        const navContainer = document.querySelector(settings.navContainer);
        if (navContainer) {
          navContainer.appendChild(prevBtn);
          navContainer.appendChild(nextBtn);
        }
      } else {
        container.parentNode.insertBefore(prevBtn, container.nextSibling);
        container.parentNode.insertBefore(nextBtn, container.nextSibling);
      }

      prevBtn.addEventListener("click", function(e) {
        e.preventDefault();
        let prevIndex = currentSlide - 1;
        if (prevIndex < 0) prevIndex = slideCount - 1;
        if (settings.pauseControls) {
          clearInterval(autoInterval);
        }
        goToSlide(prevIndex);
      });

      nextBtn.addEventListener("click", function(e) {
        e.preventDefault();
        let nextIndex = (currentSlide + 1) % slideCount;
        if (settings.pauseControls) {
          clearInterval(autoInterval);
        }
        goToSlide(nextIndex);
      });
    }

    // Auto slide
    function startAuto() {
      if (settings.auto) {
        autoInterval = setInterval(function() {
          let nextIndex = (currentSlide + 1) % slideCount;
          goToSlide(nextIndex);
        }, settings.timeout);
      }
    }

    // Pause on hover
    if (settings.pause) {
      container.addEventListener("mouseenter", function() {
        clearInterval(autoInterval);
      });
      container.addEventListener("mouseleave", function() {
        startAuto();
      });
    }

    // Initialize
    goToSlide(0);
    startAuto();

    // Handle window resize if maxwidth is set
    if (settings.maxwidth) {
      window.addEventListener("resize", function() {
        var width = window.innerWidth;
        if (width > parseInt(settings.maxwidth)) {
          container.style.width = settings.maxwidth + "px";
        } else {
          container.style.width = "100%";
        }
      });
    }
  }

  // Attach to elements
  window.responsiveSlides = function(selector, options) {
    var elements = document.querySelectorAll(selector);
    Array.prototype.forEach.call(elements, function(el) {
      responsiveSlides(el, options);
    });
  };
})(window, document);