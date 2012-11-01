class StudiesController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :edit, :update, :destroy]

  def new
  	@study = Study.new
    @products = Product.alphabetical
    @platforms = Platform.alphabetical
    @activity_types = ActivityType.alphabetical
  end

  def create
  	@study = Study.new(params[:study])
  	if @study.save
  		flash[:success] = "New study created!"
  		redirect_to @study
  	else
      @products = Product.alphabetical
      @platforms = Platform.alphabetical
      @activity_types = ActivityType.alphabetical
  		render 'new'
  	end
  end

  def show
  	@study = Study.find(params[:id])
    @findings = @study.findings.paginate(page: params[:page])
  end

  def destroy
  	Study.find(params[:id]).destroy
  	flash[:success] = "Study deleted."
  	redirect_to studies_path
  end

  def index
    if signed_in?
      @studies = Study.by_date.paginate(page: params[:page])
    else
      @studies = Study.deployed.by_date.paginate(page: params[:page])
    end
  end

  def edit
    @study = Study.find(params[:id])
    @products = Product.all
    @platforms = Platform.all
    @activity_types = ActivityType.all
  end

  def update
    @study = Study.find(params[:id])
    if @study.update_attributes(params[:study])
      flash[:success] = "Profile updated"
      redirect_to @study
    else
      @products = Product.all
      @platforms = Platform.all
      @activity_types = ActivityType.all
      render 'edit'
    end
  end
end
