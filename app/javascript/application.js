// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import TC from "@rolemodel/turbo-confirm"
import "controllers"

TC.start({ activeClass: 'confirm-dialog-wrapper--active' })

document.addEventListener('turbo:frame-missing', (event) => {
  if (event.target.id === 'modal') {
    event.preventDefault()

    event.detail.visit(event.detail.response.url, { action: 'replace' })
  }
})

document.addEventListener('turbo:before-morph-element', (event) => {
  // ensure flash notification animations are always run
  if (event.target.role === 'alert' && event.detail.newElement) {
    const parent = event.target.parentElement
    event.target.remove()
    parent.appendChild(event.detail.newElement)
  }
})
