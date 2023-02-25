import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-favourite"
export default class extends Controller {
  static targets = ['icon']
  connect() {}

  addFavourite(data){
    fetch('/favourite_places', {
      method: "POST",
      headers: {'Accept': 'application/json',
                'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
               },
      body: data
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })
  }

  removeFavourite(data, id){
    fetch(`/favourite_places/${id}`, {
      method: "DELETE",
      headers: {'Accept': 'application/json',
                'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
               },
      body: data
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })
  }

  changeIcon(event){
    event.preventDefault();
    const data = new FormData();
    let id = '';
    id = this.iconTarget.dataset.favid;
    data.append('favourite_place[place_id]', this.iconTarget.dataset.place)
    data.append('favourite_place[user_id]', this.iconTarget.dataset.user)
    if (this.iconTarget.classList.contains('fa-regular')) {
      this.iconTarget.classList.replace('fa-regular', 'fa-solid')
      this.addFavourite(data)
    } else {
      this.iconTarget.classList.replace('fa-solid', 'fa-regular')
      this.removeFavourite(data, id)
    }
  }
}
