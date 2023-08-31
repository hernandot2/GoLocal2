import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  toggle(event) {
    const iconElement = event.currentTarget;
    const locationId = iconElement.getAttribute('data-favorite-location-id');

    fetch(`/locations/${locationId}/toggle_favorite`, {
      method: 'POST',

    })
    .then(response => response.json())
    .then(data => {
      if (data.favorited) {
        iconElement.classList.remove('far');
        iconElement.classList.add('fas');
        iconElement.style.color = 'pink';
      } else {
        iconElement.classList.add('far');
        iconElement.classList.remove('fas');
        iconElement.style.color = 'black';
      }
    });
  }
}
