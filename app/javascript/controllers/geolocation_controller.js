import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="geolocation"
export default class extends Controller {
  static targets = ['distance']
  static values = {
    latitude: Number,
    longitude: Number
  }

  connect() {
    this.options = {
      enableHighAccuracy: true,
      timeout: 5000,
      maximumAge: 0,
    };
    navigator.geolocation.getCurrentPosition(
      (pos) => this.success(pos),
      (err) => this.error(err),
      this.options
    )
  }


  success(pos) {
    const crd = pos.coords;
    if (this.latitudeValue && this.longitudeValue && crd.latitude && crd.longitude) {
      const distance = this.getDistanceFromLatLonInKm(
        this.latitudeValue,
        this.longitudeValue,
        crd.latitude,
        crd.longitude
      )
      this.distanceTarget.innerHTML = `${distance.toFixed(1)} km`
    } else {
      this.distanceTarget.innerHTML = "Cannot determine distance"
    }
  }

  error(err) {
    this.distanceTarget.innerHTML = "Something went wrong. Could not load distance"
  }

  getDistanceFromLatLonInKm(lat1, lon1, lat2, lon2) {
    var R = 6371; // Radius of the earth in km
    var dLat = this.deg2rad(lat2-lat1);  // deg2rad below
    var dLon = this.deg2rad(lon2-lon1);
    var a =
      Math.sin(dLat/2) * Math.sin(dLat/2) +
      Math.cos(this.deg2rad(lat1)) * Math.cos(this.deg2rad(lat2)) *
      Math.sin(dLon/2) * Math.sin(dLon/2)
      ;
    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
    var d = R * c; // Distance in km
    return d;
  }

  deg2rad(deg) {
    return deg * (Math.PI/180)
  }
}
