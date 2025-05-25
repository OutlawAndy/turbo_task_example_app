import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    if (!this.element.open) this.open()
    this.setInert(true)
  }

  disconnect() {
    this.close()
  }

  open() {
    setTimeout(()=> this.element.show(), 0)
  }

  close() {
    this.element.close()
    this.setInert(false)
  }

  setInert(value) {
    document.getElementById('app__content').inert = value
  }
}
