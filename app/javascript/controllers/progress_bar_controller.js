import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="progress-bar"
export default class extends Controller {
  static targets = ["bar", "time", "distance", "distance_bar"]
  static values = {
    url: String,
    time: Number,
    distance: Number
  }

  connect() {
  }

  reset() {
    Swal.fire({
      title: "Are you sure?",
      text: "Your check reminders will be permanently reset!",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#0D5D56",
      cancelButtonColor: "#d33",
      confirmButtonText: "Yes, I have checked!"
    }).then((result) => {
      if (result.isConfirmed) {
        this.#updateBikeComponent()
        this.barTarget.ariaValueNow = 100
        this.barTarget.style.cssText = "width: 100%;"
        this.distance_barTarget.ariaValueNow = 100
        this.distance_barTarget.style.cssText = "width: 100%;"
        // this.barTarget.innerText = `${this.timeValue} weeks`
        if (this.timeValue <= 1) {
          this.timeTarget.innerText = `${this.timeValue * 7} days until next check`
        } else {
          this.timeTarget.innerText = `${this.timeValue} weeks until next check`
        }
        this.distanceTarget.innerText = `${this.distanceValue}km until next check`
      }
    });
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
