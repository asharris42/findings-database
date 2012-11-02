class ActivityTypesController < ApplicationController
	before_filter :signed_in_user, only: [:edit, :update, :new, :create, :destroy]

  def new
    @activity_type = ActivityType.new
  end

  def create
    @activity_type = ActivityType.new(params[:activity_type])
    if @activity_type.save
      flash[:confirmation] = "#{@activity_type.type_name} created!"
      redirect_to activity_types_url
    else
      render 'new'
    end
  end

  def edit
    @activity_type = ActivityType.find(params[:id])
  end

  def update
    @activity_type = ActivityType.find(params[:id])
    if @activity_type.update_attributes(params[:activity_type])
      flash[:confirmation] = "#{@activity_type.type_name} updated."
      redirect_to activity_types_url
    else
      render 'edit'
    end
  end

  def show
  	@activity_type = ActivityType.find(params[:id])
    if signed_in?
      @studies = @activity_type.studies.by_date.paginate(page: params[:page])
    else
      @studies = @activity_type.studies.deployed.by_date.paginate(page: params[:page])
    end
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
