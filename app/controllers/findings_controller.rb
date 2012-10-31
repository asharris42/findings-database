class FindingsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def create
		@finding = current_study.findings.build(params[:finding])
    if @finding.save
    	flash[:success] = "Finding created!"
     	redirect_to root_url
    else
    	@feed_items = []
    	render 'static_pages/home'
    end
	end

	def destroy
    @finding = findings.find_by_id(params[:id])
		@finding.destroy
		redirect_to root_url
	end

  def index
    @findings = Finding.all
    @products = Product.alphabetical
    @platforms = Platform.alphabetical
    @study_names = Study.alphabetical
    @tags = Tag.alphabetical
    @activity_types = ActivityType.alphabetical
  end

  def search
    @products = Product.alphabetical
    @platforms = Platform.alphabetical
    @study_names = Study.alphabetical
    @tags = Tag.alphabetical
    @activity_types = ActivityType.alphabetical
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

    @findings = Finding.search :conditions => conditions, :per_page => 200
  end

  private

  def correct_study
    @finding = current_study.findings.find_by_id(params[:id])
    redirect_to root_url if @finding.nil?
  end
end