// ... (previous imports and code)

// FUNCTION for vertical center when content in higher than viewport on resize
// ---------------------------------------------------------
let shouldCenterVertically = true; // Use a regular variable instead of state

const handleResize = () => {
  const innerContainer = document.querySelector(".card-group");
  if (innerContainer) {
    const innerContainerHeight = innerContainer.clientHeight;
    const viewportHeight = window.innerHeight;
    shouldCenterVertically = innerContainerHeight <= viewportHeight;
    updateVerticalCenterClass(); // Call a function to update the CSS class
  }
};

const updateVerticalCenterClass = () => {
  const mainDiv = document.querySelector(".js-main");
  if (mainDiv) {
    mainDiv.classList.toggle("v-center", shouldCenterVertically);
  }
};

// Initial resize on load
setTimeout(() => {
  handleResize();
}, 300);

// Event listener for resize
window.addEventListener("resize", handleResize);
