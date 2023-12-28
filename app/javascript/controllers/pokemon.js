// app/assets/javascripts/pokemon.js
document.addEventListener("htmx:afterRequest", function (event) {
  // Check if the response includes an alert
  if (event.detail.elt.querySelector("#alert-container")) {
    // Trigger a timeout to clear the alerts after a certain time
    setTimeout(function () {
      event.detail.elt.querySelector("#alert-container").innerHTML = "";
    }, 5000); // 5000 milliseconds (adjust as needed)
  }
});
