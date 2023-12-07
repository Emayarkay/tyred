import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.markers = []
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    this.#getUserLocation()
    // this.#zoomMap()
    this.position = {}
  }

  updateSearch(event) {
    this.markers.forEach(m => m.remove())
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      this.markers.push(
        new mapboxgl.Marker({ "color": "#0D5D56" })
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
      )
    })
  }

  #zoomMapSetCenter() {
    this.map.setZoom(15)
    this.map.setCenter([this.position.longitude, this.position.latitude])
    // console.log(this.position);
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  #getUserLocation() {
    navigator.geolocation.getCurrentPosition((position) => {
      this.position = position.coords;
      const zoomButton = document.getElementById("zoomToCurrentLocation");
      zoomButton.addEventListener("click", this.#setMapToLocation.bind(this))
      // Send latitude and longitude to the server via AJAX request or form submission
      // You can use fetch, jQuery AJAX, or other methods to send this data to your server
    });
  }

  #setMapToLocation(e) {
    e.preventDefault()
    this.#zoomMapSetCenter()
  }
}
