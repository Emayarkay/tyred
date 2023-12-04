import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-bar"
export default class extends Controller {
  static targets = ["cards", "map"]
  static values = {
    url: String
  }
  connect() {
  }

  search(event) {
    fetch(this.urlValue + `?query=${event.target.value}`, {
      headers: {
        Accept: "application/json"
      }
    })
    .then(response => response.json())
    .then(data => {
      this.cardsTarget.innerHTML = data.html
      this.mapTarget.setAttribute("data-map-markers-value", JSON.stringify(data.markers))
      dispatchEvent(new CustomEvent("updateSearch"))
    })
  }
}
