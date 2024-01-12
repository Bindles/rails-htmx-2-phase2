# app/helpers/application_helper.rb
module ApplicationHelper
  def simple_htmx_link(path, target_id, options = {})
    default_options = {
      'hx-get': path,
      'hx-swap': 'innerHTML',
      'hx-allow': 'same-origin'
    }

    options.reverse_merge!(default_options)
    options[:'hx-target'] = "##{target_id}"

    link_to('Click me', path, options)
  end
end
