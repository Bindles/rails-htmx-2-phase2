import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["contextMenu"];

  connect() {
    document.addEventListener("click", () => this.hideMenu());
    document.addEventListener("contextmenu", this.showMenu.bind(this));
  }

  showMenu(event) {
    event.preventDefault();
  
    const menu = document.getElementById("context-menu");
    const colorId = event.target.closest(".color-circle").dataset.id; // Get the color ID from the target element
  
    // Update menu items with the correct ID
    document.querySelectorAll("#context-menu li").forEach(item => {
      item.setAttribute("data-id", colorId);
    });
  
    menu.style.top = `${event.clientY}px`;
    menu.style.left = `${event.clientX}px`;
    menu.style.display = "block";
  }
  

  hideMenu() {
    const menu = document.getElementById("context-menu");
    menu.style.display = "none";
  }

  edit(event) {
    const id = event.target.dataset.id; // Get the color ID
    if (!id) {
      alert("No ID found for this color!");
      return;
    }
  
    this.hideMenu(); // Hide the context menu
    
    // Make a fetch request to the edit action with the correct Accept header
    fetch(`/qcolors/${id}/edit`, {
      method: 'GET',
      headers: {
        'Accept': 'text/vnd.turbo-stream.html' // Request Turbo Stream format
      }
    })
    .then(response => response.text())  // Parse the response as text
    .then(html => {
      // Create a Turbo Stream response using the received HTML
      Turbo.renderStreamMessage(html);
    })
    .catch(error => {
      console.error("Error fetching edit form:", error);
    });
  }
  
  
  

  delete(event) {
    const id = event.target.dataset.id; // Get the ID of the color
    this.hideMenu(); // Hide the context menu
  
    if (confirm("Are you sure you want to delete this color?")) {
      fetch(`/qcolors/${id}`, {
        method: "DELETE",
        headers: { "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content }
      })
      .then(response => {
        // If the response is successful, remove the element from the DOM
        if (response.ok) {
          const colorElement = document.querySelector(`#qcolor_${id}`);
          if (colorElement) {
            colorElement.remove(); // Remove the deleted color element from the DOM
          }
        }
      })
      .catch(error => {
        console.error("Error deleting color:", error);
      });
    }
  }
  

  move(event) {
    const id = event.target.dataset.id; // Get the ID of the color to move
    const newPosition = prompt("Enter the ID of the color to swap with:");
    this.hideMenu(); // Hide the context menu
  
    if (newPosition) {
      fetch(`/qcolors/${id}/move`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content
        },
        body: JSON.stringify({ new_id: newPosition })
      });
    }
  }
    
}
