import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="category-selection"
export default class extends Controller {

  static targets = ["input"]

  connect() {
  }

  selected(event) {
    event.currentTarget.classList.remove("w-tag-badge")
    event.currentTarget.classList.add("w-tag-badge-active")
    this.inputTarget.value += `${event.currentTarget.innerText};`
  }

}
