class StudiesController < ApplicationController
# Need to limit access to create methods eventually

  def new
  	@study = Study.new
  end

  def create
  	@study = Study.new(params[:study])
  	if @study.save
  		flash[:success] = "New study created!"
  		redirect_to @study
  	else
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
  	redirect_to root_path
  end

  def index
  	@studies = Study.paginate(page: params[:page])
  end

  def edit
    @study = Study.find(params[:id])
  end

  def update
    @study = Study.find(params[:id])
    if @study.update_attributes(params[:study])
      flash[:success] = "Profile updated"
      redirect_to @study
    else
      render 'edit'
    end
  end
end
