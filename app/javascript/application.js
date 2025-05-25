// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('turbo:frame-missing', (event) => {
  if (event.target.id === 'modal') {
    event.preventDefault()

    event.detail.visit(event.detail.response.url, { action: 'replace' })
  }
})
