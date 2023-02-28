import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user-place"
export default class extends Controller {
  connect() {
    this.map = map
  }

  create(event) {
    event.preventDefault();
    const input = event.currentTarget;
    console.log(input.closest("form").action)
    const data = new FormData()
    data.append('trip_id', event.currentTarget.dataset.tripId)

    fetch(input.closest("form").action, {
      method: "POST",
      headers: {
        'Accept': 'application/json',
        'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
      },
      body: data
    })
      .then(response => response.json())
      .then((data) => {
        if (data.marker) {
          input.checked = true
          document.querySelector('.mapboxgl-popup-close-button').click()
          if (data.first) {
            console.log('je suis la premiere place')
            this.#addFirstAndLastPopupToMap(data.marker, "first")
          } else if (data.last) {
            console.log('je suis la derniere place')
            this.#addFirstAndLastPopupToMap(data.marker, "last")
          } else {
            this.#addPopupToMap(data.marker)
          }
        }
      })
  }

  #addPopupToMap(marker) {
    const popup = new mapboxgl.Popup().setHTML(marker.info_window_html) // Add this

    new mapboxgl.Marker({color: '#4EEBF5'})
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup) // Add this
      .addTo(this.map)
  }

  // #addFirstPopupToMap(marker) {
  //   const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
  //   const el = document.createElement('i');
  //   el.className = "fa-solid fa-map-pin";
  //   el.style.fontSize = "30px";
  //   el.style.color = "#4EEBF5";
  //   el.style.backgroundSize = '100%';

  //   new mapboxgl.Marker(el)
  //     .setLngLat([ marker.lng, marker.lat ])
  //     .setPopup(popup)
  //     .addTo(this.map)

  // }

  #addFirstAndLastPopupToMap(marker, position) {
    const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
    const el = document.createElement('i');
    if (position == "first") {
      el.className = "fa-solid fa-map-pin";
      el.style.fontSize = "46px";
    } else {
      el.className = "fa-solid fa-flag";
      el.style.fontSize = "40px";
    }
    el.style.color = "#4EEBF5";
    el.style.backgroundSize = '100%';

    new mapboxgl.Marker(el, {anchor: "bottom"})
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(this.map)

  }
}
