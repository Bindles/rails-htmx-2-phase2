// app/javascript/controllers/pokemon_controller.js
import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    document.addEventListener("htmx:afterRequest", (event) => {
      if (event.detail.elt.querySelector("#alert-container")) {
        setTimeout(() => {
          event.detail.elt.querySelector("#alert-container").innerHTML = "";
        }, 5000);
      }
    });
  }
}
