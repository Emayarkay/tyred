import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="progress-bar"
export default class extends Controller {
  static targets = ["togglableElement"]
  static values = {
    time: Number
  }

  connect() {
    console.log("Hello from Progress Bar")
  }

}
