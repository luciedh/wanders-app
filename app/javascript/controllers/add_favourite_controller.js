import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-favourite"
export default class extends Controller {
  static targets = ['icon']
  connect() {
    console.log("new")
  }

  changeIcon(event){
    if (this.iconTarget.classList.contains('fa-regular')) {
      this.iconTarget.classList.replace('fa-regular', 'fa-solid')
    } else {
      this.iconTarget.classList.replace('fa-solid', 'fa-regular')
    }
  }
}
