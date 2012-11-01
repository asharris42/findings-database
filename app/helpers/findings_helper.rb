module FindingsHelper
  def handle_quotes(user_string)
    quote_count = 0
    user_string.each_char do |c| 
      if c == '"'
        quote_count+=1
      end
    end
    if quote_count%2 == 1
      user_string = user_string << '"'
    end
  end

  def search_findings
    @searched_conditions = Hash.new
    conditions = Hash.new

    # Handle Description parameters
    unless params[:description].empty? 
      content_conditions = "#{params[:description]}".gsub(/[^0-9A-Za-z'"\s\-]/, '')
      handle_quotes(content_conditions)
      conditions[:content] = content_conditions
    end

    # Handle Product parameters
    product_conditions = ""
    params[:product][:product_name].each do |product|
      unless product.empty?
        if product_conditions.empty?
          product_conditions = '"' << "#{product}".gsub(/[^0-9A-Za-z\s\-]/, '') << '"'
        else
          product_conditions = product_conditions << ' | "' << "#{product}".gsub(/[^0-9A-Za-z\s\-]/, '') << '"'
        end
      end
    end
    unless product_conditions.empty?
      conditions[:products] = product_conditions
      @searched_conditions[:product] = params[:product]
    end

    # Handle Platform parameters
    platform_conditions = ""
    params[:platform][:platform_name].each do |platform|
      unless platform.empty?
        if platform_conditions.empty?
          platform_conditions = '"' << "#{platform}".gsub(/[^0-9A-Za-z\s\-]/, '') << '"'
        else
          platform_conditions = platform_conditions << ' | "' << "#{platform}".gsub(/[^0-9A-Za-z\s\-]/, '') << '"'
        end
      end
    end
    unless platform_conditions.empty?
      conditions[:platforms] = platform_conditions
      @searched_conditions[:platform] = params[:platform]
    end

    # Handle Study name parameters
    study_conditions = ""
    params[:study][:name].each do |study|
      unless study.empty?
        if study_conditions.empty?
          study_conditions = '"' << "#{study}".gsub(/[^0-9A-Za-z\s\-]/, '') << '"'
        else
          study_conditions = study_conditions << ' | "' << "#{study}".gsub(/[^0-9A-Za-z\s\-]/, '') << '"'
        end
      end
    end
    unless study_conditions.empty? 
      conditions[:study_name] = study_conditions
      @searched_conditions[:study] = params[:study]
    end

    # Handle Tag parameters
    tag_conditions = ""
    params[:tag][:tag_name].each do |tag|
      unless tag.empty?
        if tag_conditions.empty?
          tag_conditions = '"' << "#{tag}".gsub(/[^0-9A-Za-z\s\-]/, '') << '"'
        else
          tag_conditions = tag_conditions << ' | "' << "#{tag}".gsub(/[^0-9A-Za-z\s\-]/, '') << '"'
        end
      end
    end
    unless tag_conditions.empty?
      conditions[:tags] = tag_conditions
      @searched_conditions[:tag] = params[:tag]
    end

    # Handle Activity type parameters
    activity_type_conditions = ""
    params[:activity_type][:type_name].each do |activity_type|
      unless activity_type.empty?
        if activity_type_conditions.empty?
          activity_type_conditions = '"' << "#{activity_type}".gsub(/[^0-9A-Za-z\s\-]/, '') << '"'
        else
          activity_type_conditions = activity_type_conditions << ' | "' << "#{activity_type}".gsub(/[^0-9A-Za-z\s\-]/, '') << '"'
        end
      end
    end
    unless activity_type_conditions.empty?
      conditions[:activity_types] = activity_type_conditions
      @searched_conditions[:activity_type] = params[:activity_type]
    end

    if signed_in?
      @findings = Finding.search :conditions => conditions, :per_page => 200
      @study_names = Study.alphabetical
    else
      @findings = Finding.search_deployed.search :conditions => conditions, :per_page => 200
      @study_names = Study.deployed.alphabetical
    end
  end
end