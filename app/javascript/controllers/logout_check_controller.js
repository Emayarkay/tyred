import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="logout-check"
export default class extends Controller {
  static targets = ['link']

  connect() {
  }

  logout(e) {
    e.preventDefault();
    Swal.fire({
      title: "Confirm Log Out",
      showCancelButton: true,
      confirmButtonColor: "#d33",
      cancelButtonColor: "#0D5D56",
      confirmButtonText: "Log out"
    }).then((result) => {
      if (result.isConfirmed) {
        this.linkTarget.click()
      }
    })}
}
