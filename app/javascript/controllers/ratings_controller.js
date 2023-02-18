import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="ratings"
export default class extends Controller {
  static targets = ['rating', 'upvote', 'downvote']
  static values = {
    id: Number
  }

  connect() {
    this.colorizeRating()
  }

  update(voteCount) {
    const url = `/comments/${this.idValue}`
    const commentData = new FormData()
    commentData.append("comment[rating]", voteCount);
    const options = {
      method: 'PATCH',
      headers: {
        'Accept': 'application/json',
        'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
      },
      body: commentData
    }
    fetch(url, options)
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })
  }

  vote(event) {
    let voteCount = parseInt(this.ratingTarget.innerText);
    if (event.target.dataset.value === 'upvote'){
      voteCount++;
    } else if (event.target.dataset.value === 'downvote'){
      voteCount--;
    }
    this.ratingTarget.innerText = voteCount;
    this.colorizeRating()
    this.update(voteCount)
  }

  colorizeRating() {
    if (parseInt(this.ratingTarget.innerText) > 0) {
      this.ratingTarget.style.color = '#1EDD88';
    } else if (parseInt(this.ratingTarget.innerText) < 0) {
      this.ratingTarget.style.color = '#FD1015';
    } else {
      this.ratingTarget.style.color = 'black';
    }
  }

}
