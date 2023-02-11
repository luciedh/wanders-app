import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {

  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()

    this.map.on('load', () => {
      if (this.data.get("routeValue")) {
        this.#addRoute()
        this.#addPopupToMap()
        this.#colorFirstAndLast()
      }
    })

  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  async getRoute(coord) {
    const query = await fetch(
      `https://api.mapbox.com/directions/v5/mapbox/walking/${coord}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`,
      { method: 'GET' }
    );
    const json = await query.json();
    const data = json.routes[0];
    const route = data.geometry.coordinates;
    const geojson = {
      type: 'Feature',
      properties: {},
      geometry: {
        type: 'LineString',
        coordinates: route
      }
    }
    this.map.addLayer({
      id: 'route',
      type: 'line',
      source: {
        type: 'geojson',
        data: geojson
      },
      layout: {
        'line-join': 'round',
        'line-cap': 'round'
      },
      paint: {
        'line-color': '#3887be',
        'line-width': 5,
        'line-opacity': 0.75
      }
    });
    };

  #addRoute() {
    let coord = ""
    this.markersValue.forEach((marker) => {coord = coord + marker.lng + "," + marker.lat + ";"})
    coord = coord.slice(0, -1)
    this.getRoute(coord)
  }

  #addPopupToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html) // Add this
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup) // Add this
        .addTo(this.map)
    });
  }

  #colorFirstAndLast () {
    const marker_first = this.markersValue[0]
    const popup_first = new mapboxgl.Popup().setHTML(marker_first.info_window_html)
    new mapboxgl.Marker({color: '#1EDD88'})
      .setLngLat([ marker_first.lng, marker_first.lat ])
      .setPopup(popup_first)
      .addTo(this.map)

    const marker_last = this.markersValue.pop();
    const popup_last = new mapboxgl.Popup().setHTML(marker_last.info_window_html)
    new mapboxgl.Marker({color: '#FD479E'})
      .setLngLat([ marker_last.lng, marker_last.lat ])
      .setPopup(popup_last)
      .addTo(this.map)
  }
}
