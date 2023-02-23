import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-trip-details"
export default class extends Controller {
  static targets = ["container"]
  revealContent(event) {
    this.containerTargets.forEach((containerTarget) => {
      if (containerTarget.classList.contains("active")) {
        containerTarget.classList.remove("active")
      }
    })
    event.currentTarget.classList.toggle("active");
  }
}
