import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comment-section"
export default class extends Controller {
  static targets = ['button', 'section']

  displayComments(event){
    this.sectionTarget.classList.toggle('d-none');
    if (this.sectionTarget.classList.contains('d-none')) {
      this.buttonTarget.classList.replace('fa-minus', 'fa-plus')
    } else {
      this.buttonTarget.classList.replace('fa-plus', 'fa-minus')
    }
  }
}
