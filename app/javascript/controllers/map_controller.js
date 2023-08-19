// app/javascript/controllers/map_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    });

    // Inicializa um objeto vazio para armazenar os marcadores por ID.
    this.markersById = {};

    this.addMarkersToMap();
    this.fitMarkersToMap();
  }

  addMarkersToMap() {
    this.markersValue.forEach((markerData) => {
      const popup = new mapboxgl.Popup().setHTML(markerData.info_window_html);
      const element = document.createElement('div');
      // element.className = 'marker';
      // element.style.backgroundImage = 'url("/path/to/your/default/marker/image.png")';
      // element.style.width = '50px';
      // element.style.height = '50px';
         element.innerHTML = markerData.marker_html
      const mapboxMarker = new mapboxgl.Marker(element)
        .setLngLat([markerData.lng, markerData.lat])
        .setPopup(popup)
        .addTo(this.map);

      // Armazena o marcador no objeto usando o ID do marcador como chave.
      this.markersById[markerData.id] = mapboxMarker;
    });
  }

  fitMarkersToMap() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  highlightMarker(event) {
    const locationId = event.currentTarget.dataset.id;
    const marker = this.markersById[locationId];

    // Lógica para destacar o marcador (por exemplo, substituir o ícone ou ampliá-lo)
    marker.getElement().style.transform = "scale(1.5)";
  }
}

// document.querySelectorAll('.location-link').forEach(link => {
//   link.addEventListener('mouseover', (event) => {
//     const markerId = event.currentTarget.parentElement.getAttribute("data-id");


//     const controller = application.getControllerForElementAndIdentifier(event.currentTarget.parentElement, "map");
//     controller.highlightMarker({ currentTarget: { dataset: { id: markerId } } });
//   });
// });
