import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="progress-bar"
export default class extends Controller {
  static targets = ["bar"]
  static values = {
    url: String,
    time: Number
  }

  connect() {
    console.log("Hello from Progress Bar")
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
        this.barTarget.innerText = `${this.timeValue} weeks`
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
