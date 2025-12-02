/* Custom JavaScript for Openwater documentation */

// Add custom functionality here
console.log('Openwater Documentation loaded');

// Example: Track external link clicks
document.addEventListener('DOMContentLoaded', function() {
  const externalLinks = document.querySelectorAll('a[href^="http"]:not([href*="openwater.health"])');
  
  externalLinks.forEach(link => {
    link.setAttribute('target', '_blank');
    link.setAttribute('rel', 'noopener noreferrer');
  });
});
