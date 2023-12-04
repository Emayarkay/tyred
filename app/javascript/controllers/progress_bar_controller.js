import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="progress-bar"
export default class extends Controller {
  static targets = ["bar", "time"]
  static values = {
    url: String,
    time: Number
  }

  connect() {
    // console.log("Hello from Progress Bar")
  }

  reset() {
    // console.log("hello from reset")
    this.#updateBikeComponent()
    this.barTarget.ariaValueNow = 100
    this.barTarget.style.cssText = "width: 100%;"
    // this.barTarget.innerText = `${this.timeValue} weeks`
    if (this.timeValue <= 1) {
      this.timeTarget.innerText = `${this.timeValue * 7} days until check`
    } else {
      this.timeTarget.innerText = `${this.timeValue} weeks until check`

    }
  }

  #updateBikeComponent() {
    const url = this.urlValue
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content
    const formData = new FormData()
    formData.append("bike_component[date_added]", new Date())
    fetch(url, {
      headers: {
        "X-CSRF-Token": csrfToken,
        "Accept": "text/plain"
      },
      method: "PATCH",
      body: formData
    })
  }

}
