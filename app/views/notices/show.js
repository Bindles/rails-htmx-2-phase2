// app/views/notices/show.js.erb
document.addEventListener("DOMContentLoaded", function () {
  var noticeContainer = document.querySelector("#notice-container");

  if ("<%= @message.present? %>") {
    noticeContainer.innerHTML =
      '<div class="alert alert-success"><%= @message %></div>';
  } else {
    noticeContainer.innerHTML = ""; // Clear the container if no message
  }
});
