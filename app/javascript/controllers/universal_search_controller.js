import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "input", "results", "labels"]

  update() {
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then(data => {
        this.resultsTarget.innerHTML = data
        this.toggleLabels()

      })
  }

  toggleLabels() {
    if(this.inputTarget.value.trim() === '') {
      this.labelsTarget.style.display = 'none';
      this.resultsTarget.style.display = 'none';
    } else {
      this.labelsTarget.style.display = 'none';
      this.resultsTarget.style.display = 'block';
    }
  }
}
