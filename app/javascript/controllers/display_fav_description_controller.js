import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-fav-description"
export default class extends Controller {

  revealContent(event) {
    event.currentTarget.classList.toggle("active");
  }
}
