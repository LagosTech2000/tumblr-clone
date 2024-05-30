// app/javascript/controllers/comments_modal_controller.js
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["modal"]

  open(event) {
    event.preventDefault()
    const postId = event.currentTarget.dataset.postId

    fetch(`/posts/${postId}/comments`, {
      headers: {
        Accept: "text/vnd.turbo-stream.html"
      }
    })
    .then(response => response.text())
    .then(html => {
      document.body.insertAdjacentHTML("beforeend", html)
      this.modalTarget.classList.remove("hidden")
    })
  }

  close() {
    this.modalTarget.remove()
  }
}
