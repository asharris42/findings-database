class PlatformsController < ApplicationController
	before_filter :signed_in_user, only: [:edit, :update, :new, :create, :destroy]

	def new
		@platform = Platform.new
	end

	def create
		@platform = Platform.new(params[:platform])
    if @platform.save
      flash[:confirmation] = "New platform created!"
      redirect_to platforms_url
    else
      render 'new'
    end
	end

	def edit
	end

	def update
	end

  def show
  	@platform = Platform.find(params[:id])
    @studies = @platform.studies.by_date.paginate(page: params[:page])
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
