import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-trip-details"
export default class extends Controller {

  connect() {
  }

  revealContent(event) {
    const trip_selection = event.currentTarget.querySelector(".trip-details")
    trip_selection.classList.remove("d-none");
    trip_selection.classList.add("card-trip");
  }
}
