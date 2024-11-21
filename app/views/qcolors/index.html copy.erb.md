<p style="color: green"><%= notice %></p>

<h1>Qcolors</h1>

<%= render 'form', qcolor: Qcolor.new %>

<div id="qcolors">
  <% @qcolors.each do |qcolor| %>
    <%= render qcolor %>
    <p>
      <%= link_to "Show this qcolor", qcolor %>
    </p>
  <% end %>
</div>

<%= link_to "New qcolor", new_qcolor_path %>
