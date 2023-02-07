import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="category-selection"
export default class extends Controller {
  static targets = ["category"]

  connect() {
    console.log(this.categoryTarget)
  }

  selected(event) {
    this.element.classList.add("red")
    console.log(event.target.innerText)
  }

}
