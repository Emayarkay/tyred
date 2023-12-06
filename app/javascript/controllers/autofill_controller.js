import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="autofill"
export default class extends Controller {
  static targets = ['component', 'name', 'time', 'distance', 'description']

  connect() {
  }

  autofill(e) {
    e.preventDefault()
    fetch(this.componentTarget.options[this.componentTarget.selectedIndex].value,
      {
        headers: {
        'Content-Type': 'application/json'
      }
    })
    .then((response) => response.json())
    .then((data) => {
      this.nameTarget.value = data.component.name
      this.timeTarget.value = data.component.time_until_check
      this.distanceTarget.value = data.component.distance_until_check
      this.descriptionTarget.value = data.component.check_advice
    })

  }
}
