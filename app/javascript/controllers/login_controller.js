import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="controller"
export default class extends Controller {
  static targets = ["loginform", "signupform"]

  connect() {
    console.log(this.loginformTarget)
    console.log(this.signupformTarget)
  }

  revealLogin() {
    this.loginformTarget.classList.toggle("d-none")
  }

  revealSignup() {
    this.signupformTarget.classList.toggle("d-none")
  }
}
