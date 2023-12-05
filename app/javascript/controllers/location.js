document.addEventListener('DOMContentLoaded', () => {
  navigator.geolocation.getCurrentPosition((position) => {
    const { latitude, longitude } = position.coords;
    // Send latitude and longitude to the server via AJAX request or form submission
    // You can use fetch, jQuery AJAX, or other methods to send this data to your server
  });
});
