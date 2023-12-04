import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-advice"
export default class extends Controller {
  static targets = ["togglableElement", "button"]
  static values = {
    component: String
  }

  connect() {
    console.log("hello from toggle")
  }

  fire() {
    console.log("fire")
    this.togglableElementTarget.classList.toggle("d-none");
    if (this.buttonTarget.innerText === `Show Me How To Check My ${this.componentValue}`){
      this.buttonTarget.innerText = "Hide Check Advice"
    } else {
      this.buttonTarget.innerText= `Show Me How To Check My ${this.componentValue}`
    }
  }
}
