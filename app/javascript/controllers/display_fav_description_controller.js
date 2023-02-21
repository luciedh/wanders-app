import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-fav-description"
export default class extends Controller {
  connect() {
    console.log("hello for display description")
  }
  revealContent(event) {
    console.log(event)
    event.currentTarget.classList.toggle("active");
  }
}
