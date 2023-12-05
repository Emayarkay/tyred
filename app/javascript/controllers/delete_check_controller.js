import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="delete-check"
export default class extends Controller {
  static targets = ['link', 'icon']

  connect() {
    console.log("hello from delete check")
  }


  delete_component(e) {
    e.preventDefault();
    Swal.fire({
      title: "Are you sure you want to delete this component?",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#d33",
      cancelButtonColor: "#0D5D56",
      confirmButtonText: "Delete"
    }).then((result) => {
      if (result.isConfirmed) {
        this.iconTarget.click()
      }
    })}

  delete_bike(e) {
    e.preventDefault();
    Swal.fire({
      title: "Are you sure you want to delete this bike?",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#d33",
      cancelButtonColor: "#0D5D56",
      confirmButtonText: "Delete"
    }).then((result) => {
      if (result.isConfirmed) {
        this.linkTarget.click()
      }
    })}

}
