class PlatformsController < ApplicationController
	before_filter :signed_in_user, only: [:edit, :update, :new, :create, :destroy]

	def new
		@platform = Platform.new
	end

	def create
		@platform = Platform.new(params[:platform])
    if @platform.save
      flash[:confirmation] = "#{@platform.platform_name} created!"
      redirect_to platforms_url
    else
      render 'new'
    end
	end

	def edit
    @platform = Platform.find(params[:id])
  end

  def update
    @platform = Platform.find(params[:id])
    if @platform.update_attributes(params[:platform])
      flash[:confirmation] = "#{@platform.platform_name} updated."
      redirect_to platforms_url
    else
      render 'edit'
    end
	end

  def show
  	@platform = Platform.find(params[:id])
    if signed_in?
      @studies = @platform.studies.by_date.paginate(page: params[:page])
    else
      @studies = @platform.studies.deployed.by_date.paginate(page: params[:page])
    end
  end

  def index
  	@platforms = Platform.alphabetical
  end

  def destroy
  	Platform.find(params[:id]).destroy
    flash[:confirmation] = "Platform deleted."
    redirect_to platforms_url
  end

end
