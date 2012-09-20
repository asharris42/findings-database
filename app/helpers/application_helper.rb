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

  def made_choices?(form_field)
    if form_field == "Any"
      return false
    else
      return true
    end
  end


  def current_study
  	#need some code to identify current study?
  	
  end
end