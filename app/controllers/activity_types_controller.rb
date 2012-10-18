class ActivityTypesController < ApplicationController
	before_filter :signed_in_user, only: [:edit, :update, :new, :create, :destroy, :index, :show]

  def new
    @activity_type = ActivityType.new
  end

  def create
    @activity_type = ActivityType.new(params[:activity_type])
    if @activity_type.save
      flash[:confirmation] = "New activity type created!"
      redirect_to activity_types_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def show
  	@activity_type = ActivityType.find(params[:id])
    @studies = @activity_type.studies.by_date.paginate(page: params[:page])
  end

  def index
  	@activity_types = ActivityType.alphabetical
  end

  def destroy
  	ActivityType.find(params[:id]).destroy
    flash[:confirmation] = "Activity type deleted."
    redirect_to activity_types_url
  end
end
