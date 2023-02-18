import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comment-section"
export default class extends Controller {
  static targets = ['button', 'section', 'form', 'list']

  displayComments(event){
    this.sectionTarget.classList.toggle('d-none');
    if (this.sectionTarget.classList.contains('d-none')) {
      this.buttonTarget.classList.replace('fa-minus', 'fa-plus')
    } else {
      this.buttonTarget.classList.replace('fa-plus', 'fa-minus')
    }
  }

  createComment(event) {
    event.preventDefault();
    const url = this.formTarget.action
    const options = {
      method: 'POST',
      headers: {'Accept': 'application/json',
                'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content},
      body: new FormData(this.formTarget)
    }
    fetch(url, options)
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          this.listTarget.insertAdjacentHTML("beforeend", data.inserted_item)
        };
      })
  }
}
