module ApplicationHelper
	def full_title(page_title)
    base_title = "Findings Database"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def current_study
  	#need some code to identify current study?
  	
  end
end