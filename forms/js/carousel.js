const items = document.querySelectorAll('.carousel li');
let currentIndex = 0;
let totalItems = items.length;
let intervalId;
let isPaused = false;
// Initialise first image as active
items[currentIndex].classList.add('active');
function showNext() {
  if (isPaused) return;
  const currentItem = items[currentIndex];
  // Remove active class from current
  currentItem.classList.remove('active');
  // Move to next index
  currentIndex = (currentIndex + 1) % totalItems;
  const nextItem = items[currentIndex];
  // Add active class to next
  nextItem.classList.add('active');
}
// Pause
const container = document.querySelector('.slides');
container.addEventListener('mouseenter', () => { isPaused = true; });
container.addEventListener('mouseleave', () => { isPaused = false; });
container.addEventListener('touchstart', () => { isPaused = true; });
container.addEventListener('touchend', () => { isPaused = false; });
// Start auto sliding with cross-fade
intervalId = setInterval(showNext, 4500);
