module ApplicationHelper
	def full_title(page_title)
    base_title = "Findings Database"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'current' : nil

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

end