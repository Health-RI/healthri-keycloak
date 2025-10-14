// Enhanced Login Form Handling with Error Management
// =================================================

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

// Form Validation and Error Handling
// ----------------------------------
const validateForm = () => {
  const username = document.getElementById('username');
  const password = document.getElementById('password');
  let isValid = true;
  
  // Clear previous error states
  username.classList.remove('error');
  password.classList.remove('error');
  
  // Remove any existing client-side error messages
  const existingError = document.querySelector('.client-error');
  if (existingError) {
    existingError.remove();
  }
  
  // Validate username
  if (!username.value.trim()) {
    username.classList.add('error');
    isValid = false;
  }
  
  // Validate password
  if (!password.value.trim()) {
    password.classList.add('error');
    isValid = false;
  }
  
  return isValid;
};

const showClientError = (message) => {
  const form = document.getElementById('kc-form-login');
  const existingError = document.querySelector('.client-error');
  
  if (existingError) {
    existingError.remove();
  }
  
  const errorDiv = document.createElement('div');
  errorDiv.className = 'alert alert-danger client-error';
  errorDiv.setAttribute('role', 'alert');
  errorDiv.innerHTML = `<span class="error-text">${message}</span>`;
  
  form.insertBefore(errorDiv, form.firstChild);
};



// Enhanced form submission handling
const handleFormSubmit = (event) => {
  const form = event.target;
  
  if (!validateForm()) {
    event.preventDefault();
    const emptyFields = [];
    const username = document.getElementById('username');
    const password = document.getElementById('password');
    
    if (!username.value.trim()) emptyFields.push('username');
    if (!password.value.trim()) emptyFields.push('password');
    
    let errorMessage = 'Please fill in all required fields.';
    if (emptyFields.includes('username') && emptyFields.includes('password')) {
      errorMessage = 'Please enter your username and password.';
    } else if (emptyFields.includes('username')) {
      errorMessage = 'Please enter your username.';
    } else if (emptyFields.includes('password')) {
      errorMessage = 'Please enter your password.';
    }
    
    showClientError(errorMessage);
    return false;
  }
  
  // Let the form submit naturally
  return true;
};

// Input field error state management
const handleInputFocus = (event) => {
  const input = event.target;
  input.classList.remove('error');
  
  // Remove client-side error messages when user starts typing
  const clientError = document.querySelector('.client-error');
  if (clientError) {
    setTimeout(() => {
      if (clientError.parentNode) {
        clientError.remove();
      }
    }, 100);
  }
};

// Auto-dismiss error messages after a delay
const autoDismissErrors = () => {
  const errors = document.querySelectorAll('.alert:not(.client-error)');
  errors.forEach(error => {
    setTimeout(() => {
      error.style.transition = 'opacity 0.3s ease-out';
      error.style.opacity = '0';
      setTimeout(() => {
        if (error.parentNode) {
          error.remove();
        }
      }, 300);
    }, 8000); // Auto-dismiss after 8 seconds
  });
};

// Initialize error handling when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
  const form = document.getElementById('kc-form-login');
  const usernameInput = document.getElementById('username');
  const passwordInput = document.getElementById('password');
  
  if (form) {
    form.addEventListener('submit', handleFormSubmit);
  }
  
  if (usernameInput) {
    usernameInput.addEventListener('focus', handleInputFocus);
    usernameInput.addEventListener('input', handleInputFocus);
  }
  
  if (passwordInput) {
    passwordInput.addEventListener('focus', handleInputFocus);
    passwordInput.addEventListener('input', handleInputFocus);
  }
  
  // Auto-dismiss existing error messages
  autoDismissErrors();
  
  // Focus on the first empty field or username by default
  setTimeout(() => {
    if (usernameInput && !usernameInput.value.trim()) {
      usernameInput.focus();
    } else if (passwordInput && !passwordInput.value.trim()) {
      passwordInput.focus();
    }
  }, 100);
  
  // Language Switcher Enhancement
  initializeLanguageSwitcher();
});

// Language Switcher Enhancement
const initializeLanguageSwitcher = () => {
  const languageToggle = document.querySelector('.language-toggle');
  const languageDropdown = document.querySelector('.language-dropdown');
  
  if (languageToggle && languageDropdown) {
    // Close dropdown when clicking outside
    document.addEventListener('click', function(event) {
      if (!languageDropdown.contains(event.target)) {
        languageDropdown.classList.remove('open');
      }
    });
    
    // Toggle dropdown on click
    languageToggle.addEventListener('click', function(event) {
      event.stopPropagation();
      languageDropdown.classList.toggle('open');
    });
    
    // Handle keyboard navigation
    languageToggle.addEventListener('keydown', function(event) {
      if (event.key === 'Enter' || event.key === ' ') {
        event.preventDefault();
        languageDropdown.classList.toggle('open');
      }
      if (event.key === 'Escape') {
        languageDropdown.classList.remove('open');
      }
    });
    
    // Close on language selection
    const languageOptions = document.querySelectorAll('.language-option');
    languageOptions.forEach(function(option) {
      option.addEventListener('click', function() {
        languageDropdown.classList.remove('open');
      });
    });
  }
};

// Initial resize on load
setTimeout(() => {
  handleResize();
}, 300);

// Event listener for resize
window.addEventListener("resize", handleResize);
