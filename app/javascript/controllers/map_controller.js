// app/javascript/controllers/map_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  initialize() {
    const locationLinks = document.querySelectorAll('.map-marker-link');
    locationLinks.forEach(link => {
      link.addEventListener('mouseover', this.highlightMarker.bind(this));
      link.addEventListener('mouseout', this.unhighlightMarker.bind(this));
    });
  }

  //   document.addEventListener('DOMContentLoaded', () => {
  //     const locationLinks = document.querySelectorAll('.map-marker');
  //     locationLinks.forEach(link => {
  //       link.addEventListener('click', this.toggleMarkerSize.bind(this));
  //     });
  //   });
  // }



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

    this.map.resize();
    // document.addEventListener('click', (event) => {
    //   if (event.target.matches('.seu-seletor-de-endereco'))
    //   console.log("Evento de clique capturado");
  }

  addMarkersToMap() {
    this.markersValue.forEach((markerData) => {
      const popup = new mapboxgl.Popup().setHTML(`<div style="font-size: 12px;">${markerData.info_window_html.replace('<h2>', '<h2 style="font-size: 14px;">')}
      </div>
    `);
      const element = document.createElement('div');
         element.innerHTML = markerData.marker_html
      const mapboxMarker = new mapboxgl.Marker(element)
        .setLngLat([markerData.lng, markerData.lat])
        .setPopup(popup)
        .addTo(this.map);


      this.markersById[markerData.id] = mapboxMarker;
    });
  }

  fitMarkersToMap() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  updateMarkerSize(marker, size) {
    const icon = marker.getElement();
    const img = icon.querySelector('.map-marker');
    if (img) {
      img.style.width = `${size}px`;
      img.style.height = `${size}px`;
    }
  }

  highlightMarker(event) {
    console.log("mouseover");
    const locationId = event.currentTarget.dataset.id;
    const marker = this.markersById[locationId];
    if (marker) {
      console.log("Marker found");
      this.updateMarkerSize(marker, 60);  // Aumenta o tamanho para 60px
    }
  }

  unhighlightMarker(event) {
    const locationId = event.currentTarget.dataset.id;
    const marker = this.markersById[locationId];
    if (marker) {
      this.updateMarkerSize(marker, 30);  // Reduz o tamanho para 30px
    }
  }
}
