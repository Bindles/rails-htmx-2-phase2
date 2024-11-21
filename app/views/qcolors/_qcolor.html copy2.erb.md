<div 
  class="color-circle" 
  style="background-color: <%= qcolor.value %>; border: 2px solid black; 
         width: 100px; height: 100px; border-radius: 50%; 
         display: flex; justify-content: center; align-items: center;"
>
  <%= qcolor.name %>
</div>

<div id="qcolor_<%= qcolor.id %>" 
     class="color-circle" 
     data-id="<%= qcolor.id %>" 
     style="background-color: <%= qcolor.value %>;">
  <%= qcolor.name %>
</div>

