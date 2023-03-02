import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    home: { type: Boolean, default: false }
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.#initMap()
  }

  #handleUserLocation() {
    const previousUserCoords = this.#getUserCoordsFromLocalStorage()
    if (previousUserCoords) {
      this.#centerMapToCoords(previousUserCoords[0], previousUserCoords[1])
      this.#createUserMarker(previousUserCoords[0], previousUserCoords[1])
    }
    this.#getCurrentPosition()
    this.#watchUserlocation()
  }

  #setUserCoordsInLocalStorage(lat, lng) {
    localStorage.setItem('userCoords', `[${lat}, ${lng}]`)
  }

  #getUserCoordsFromLocalStorage() {
    try {
      return JSON.parse(localStorage.getItem('userCoords'))
    } catch (error) {
      console.warn(error);
    }
  }

  disconnect() {
    this.#setUserCoordsInLocalStorage(this.userLat, this.userLng)
  }

  #getCurrentPosition() {
    const options = {
      enableHighAccuracy: true,
      timeout: 1000,
      maximumAge: 0,
    }

    const success = (pos) => {
      const crd = pos.coords
      this.userLat = crd.latitude
      this.userLng = crd.longitude
      this.#setUserCoordsInLocalStorage(crd.latitude, crd.longitude)
      this.#centerMapToCoords(crd.latitude, crd.longitude)
    }

    const error = (err) => {
      console.warn(`ERROR(${err.code}): ${err.message}`)
    }

    navigator.geolocation.getCurrentPosition(success.bind(this), error.bind(this), options);
  }

  #initMap() {
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    global.map = this.map

    if (this.homeValue) this.#addMarkersToMap()
    // this.#fitMapToMarkers() // Uncomment this and comment l:168 if map should be centered on places

    this.map.on('load', () => {
      if (this.data.get("routeValue")) {
        this.#addRoute()
        this.#addPopupToMap()
        this.#colorFirstAndLast()
      }
    })
    this.#handleUserLocation()
  }

  #addMarkersToMap() {
    this.markersValue.slice(1,-2).forEach((marker) => {
      new mapboxgl.Marker({color: '#151468'})
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  }

  #centerMapToCoords(lat, lng) {
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([ lng, lat ])
    this.map.fitBounds(bounds, this.#fitOptions())
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, this.#fitOptions())
  }

  #fitOptions() {
    return { padding: 70, maxZoom: 15, duration: 0 }
  }

  async getRoute(coord) {
    const url   = `https://api.mapbox.com/directions/v5/mapbox/walking/${coord}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`
    const query = await fetch(url)
    const json  = await query.json();
    const data  = json.routes[0];
    const route = data.geometry.coordinates;
    const geojson = {
      type: 'Feature',
      geometry: {
        type: 'LineString',
        coordinates: route
      }
    }
    const layerOptions = {
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
        'line-color': '#151468',
        'line-width': 4,
        'line-opacity': 0.75
      }
    }
    this.map.addLayer(layerOptions);
  }

  #addRoute() {
    let coord = ""
    this.markersValue.forEach((marker) => {coord = coord + marker.lng + "," + marker.lat + ";"})
    coord = coord.slice(0, -1)
    this.getRoute(coord)
  }

  #addPopupToMap() {
    this.markersValue.slice(1,-2).forEach((marker) => {
      const popup   = new mapboxgl.Popup().setHTML(marker.info_window_html)
      const myColor = marker.visited ? '#4EEBF5' : '#151468'

      new mapboxgl.Marker({color: myColor})
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    });
  }

  #colorFirstAndLast () {
    const marker_first = this.markersValue[0]
    const popup_first  = new mapboxgl.Popup().setHTML(marker_first.info_window_html)

    const el = document.createElement('i');
    el.className            = "fa-solid fa-map-pin";
    el.style.fontSize       = "30px";
    el.style.color          = marker_first.visited ? '#4EEBF5' : '#151468'
    el.style.backgroundSize = '100%';

    new mapboxgl.Marker(el)
      .setLngLat([ marker_first.lng, marker_first.lat ])
      .setPopup(popup_first)
      .addTo(this.map)

    const marker_last = this.markersValue.pop();
    const popup_last  = new mapboxgl.Popup().setHTML(marker_last.info_window_html)

    const el_finish = document.createElement('i');
    el_finish.className            = "fa-solid fa-flag";
    el_finish.style.fontSize       = "30px";
    el_finish.style.color          = marker_last.visited ? '#4EEBF5' : '#151468'
    el_finish.style.backgroundSize = '100%';

    new mapboxgl.Marker(el_finish)
      .setLngLat([ marker_last.lng, marker_last.lat ])
      .setPopup(popup_last)
      .addTo(this.map)
  }

  #watchUserlocation() {
    navigator.geolocation.watchPosition(this.#getUserLocation.bind(this));
  }

  #getUserLocation(position) {
    if (this.userMarker) this.userMarker.remove()

    const lat = position.coords.latitude
    const lng = position.coords.longitude
    this.userLat = lat
    this.userLng = lng
    this.#setUserCoordsInLocalStorage(lat, lng)
    this.#createUserMarker(lat, lng)
  }

  #createUserMarker(lat, lng) {
    const el  = document.createElement('div')

    el.classList = "user-marker"
    el.innerHTML = '<i class="fa-solid fa-person" id="user-icon"></i>';

    this.userMarker = new mapboxgl.Marker(el)
      .setLngLat([lng, lat])
      .addTo(this.map)
    this.#centerMapToCoords(lat, lng)
  }
}
