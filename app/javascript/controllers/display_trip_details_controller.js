import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-trip-details"
export default class extends Controller {
  revealContent(event) {
    event.currentTarget.classList.toggle("active");
  }
}
