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
    if signed_in?
      @findings = Finding.all
      @study_names = Study.alphabetical
    else
      @findings = Finding.deployed
      @study_names = Study.deployed.alphabetical
    end
    @products = Product.alphabetical
    @platforms = Platform.alphabetical
    @tags = Tag.alphabetical
    @activity_types = ActivityType.alphabetical
  end

  def search
    @products = Product.alphabetical
    @platforms = Platform.alphabetical
    @tags = Tag.alphabetical
    @activity_types = ActivityType.alphabetical
    
    search_findings
  end

  private

  def correct_study
    @finding = current_study.findings.find_by_id(params[:id])
    redirect_to root_url if @finding.nil?
  end
end