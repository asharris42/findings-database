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
    query_conditions = ""

    # Handle Description parameters
    unless params[:description].empty?
        query_conditions = ":content => " << '"#{params[:description]}"'
    end

    # Handle Product parameters
    product_conditions = ""
    params[:product][:product_name].each do |product|
      unless product.empty?
        if product_conditions.empty?
          product_conditions = '"' << "#{product}" << '"'
        else
          product_conditions = product_conditions << ' | "' << "#{product}" << '"'
        end
      end
    end
    unless product_conditions.empty?
      if query_conditions.empty?
        query_conditions = ":products => '" << "#{product_conditions}" << "'"
      else
        query_conditions = query_conditions << ", :products => '" << "#{product_conditions}" << "'"
      end
    end

    # Handle Platform parameters
    platform_conditions = ""
    params[:platform][:platform_name].each do |platform|
      unless platform.empty?
        if platform_conditions.empty?
          platform_conditions = '"' << "#{platform}" << '"'
        else
          platform_conditions = platform_conditions << ' | "' << "#{platform}" << '"'
        end
      end
    end
    unless platform_conditions.empty?
      if query_conditions.empty?
        query_conditions = ":platforms => '" << "#{platform_conditions}" << "'"
      else
        query_conditions = query_conditions << ", :platforms => '" << "#{platform_conditions}" << "'"
      end
    end

    # Handle Study name parameters
    study_conditions = ""
    params[:study][:name].each do |study|
      unless study.empty?
        if study_conditions.empty?
          study_conditions = '"' << "#{study}" << '"'
        else
          study_conditions = study_conditions << ' | "' << "#{study}" << '"'
        end
      end
    end
    unless study_conditions.empty?
      if query_conditions.empty?
        query_conditions = ":study_name => '" << "#{study_conditions}" << "'"
      else
        query_conditions = query_conditions << ", :study_name => '" << "#{study_conditions}" << "'"
      end
    end

    # Handle Tag parameters
    tag_conditions = ""
    params[:tag][:tag_name].each do |tag|
      unless tag.empty?
        if tag_conditions.empty?
          tag_conditions = '"' << "#{tag}" << '"'
        else
          tag_conditions = tag_conditions << ' | "' << "#{tag}" << '"'
        end
      end
    end
    unless tag_conditions.empty?
      if query_conditions.empty?
        query_conditions = ":tags => '" << "#{tag_conditions}" << "'"
      else
        query_conditions = query_conditions << ", :tags => '" << "#{tag_conditions}" << "'"
      end
    end

    # Handle Activity type parameters
    activity_type_conditions = ""
    params[:activity_type][:type_name].each do |activity_type|
      unless activity_type.empty?
        if activity_type_conditions.empty?
          activity_type_conditions = '"' << "#{activity_type}" << '"'
        else
          activity_type_conditions = activity_type_conditions << ' | "' << "#{activity_type}" << '"'
        end
      end
    end
    unless activity_type_conditions.empty?
      if query_conditions.empty?
        query_conditions = ":activity_types => '" << "#{activity_type_conditions}" << "'"
      else
        query_conditions = query_conditions << ", :activity_types => '" << "#{activity_type_conditions}" << "'"
      end
    end

    query = "Finding.search '', :conditions => { " << query_conditions << " }, :per_page => 200"
    @findings = eval(query)
  end

  private

  def correct_study
    @finding = current_study.findings.find_by_id(params[:id])
    redirect_to root_url if @finding.nil?
  end
end