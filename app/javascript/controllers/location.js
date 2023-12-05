document.addEventListener('DOMContentLoaded', () => {
  navigator.geolocation.getCurrentPosition((position) => {
    const { latitude, longitude } = position.coords;
    // Send latitude and longitude to the server via AJAX request or form submission
    // You can use fetch, jQuery AJAX, or other methods to send this data to your server
  });

  const zoomButton = document.getElementById("zoomToCurrentLocation");

  if (navigator.geolocation && zoomButton) {
    zoomButton.addEventListener("click", function () {
      navigator.geolocation.getCurrentPosition(function (position) {
        const { latitude, longitude } = position.coords;

        // Access the Mapbox instance and set the map's center to the user's location
        map.setCenter([longitude, latitude]); // Assuming 'map' is your Mapbox instance
        map.setZoom(15); // Adjust the zoom level as needed
      });
    });
  }

});
