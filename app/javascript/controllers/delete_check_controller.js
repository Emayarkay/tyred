import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="delete-check"
export default class extends Controller {
  static targets = ['link', 'icon']
  static values = {
    path: String
  }

  connect() {
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
        this.sendDelete()
      }
    })
  }

  sendDelete() {
    fetch(this.pathValue, {
      method: 'DELETE',
      headers: {
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content,
        "Accept": "text/plain"
      }
    }).then(response => {
      if (response.status === 200) {
        this.element.classList.add('away')
        setTimeout(() => {
          this.element.style.marginBottom = `-${this.element.clientHeight}px`;
        }, 300);
      }
    })
  }

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
    })
  }

}
