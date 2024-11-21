<%= turbo_frame_tag "qcolor_#{@qcolor.id}" do %>
  aaaaa
<% end %>

<%= turbo_stream.append :qcolors_editor, partial: 'qcolors/form', locals: { qcolor: @qcolor } %>
