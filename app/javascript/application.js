// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import 'bootstrap'


function confirmDelete(event) {
  event.preventDefault(); // prevent the default form submission
  if (confirm("Are you sure you want to delete this?")) {
    event.target.closest("form").submit(); // submit the form
  }
}

