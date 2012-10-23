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
    @products = Product.all
    @platforms = Platform.all
    @study_names = Study.all
  end

  def search
    @products = Product.all
    @platforms = Platform.all
    @study_names = Study.all
    query_conditions = ""
    unless params[:description].empty?
        query_conditions = ":content => " << '"#{params[:description]}"'
    end
    unless params[:products].empty?
      if query_conditions.empty?
        query_conditions = ":products => " << '"#{params[:products]}"'
      else
        query_conditions = query_conditions << ", :products => " << '"#{params[:products]}"'
      end
    end
    unless params[:platforms].empty?
      if query_conditions.empty?
        query_conditions = ":platforms => " << '"#{params[:platforms]}"'
      else
        query_conditions = query_conditions << ", :platforms => " << '"#{params[:platforms]}"'
      end
    end
    unless params[:study_name].empty?
      if query_conditions.empty?
        query_conditions = ":study_name => " << '"#{params[:study_name]}"'
      else
        query_conditions = query_conditions << ", :study_name => " << '"#{params[:study_name]}"'
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