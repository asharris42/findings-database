class TagsController < ApplicationController
  before_filter :signed_in_user,  only: [:new, :create, :edit, :update, :destroy]

  def new
  	@tag = Tag.new
	end

	def create
		@tag = Tag.new(params[:tag])
    if @tag.save
      flash[:confirmation] = "#{@tag.tag_name} created!"
      redirect_to tags_url
    else
      render 'new'
    end
  end

  def edit
  	@tag = Tag.find(params[:id])
  end

  def update
  	@tag = Tag.find(params[:id])
    if @tag.update_attributes(params[:tag])
      flash[:success] = "#{@tag.tag_name} updated."
      redirect_to tags_url
    else
      render 'edit'
    end
  end

  def show
  	@tag = Tag.find(params[:id])
    @findings = @tag.findings.paginate(page: params[:page])
  end

  def index
  	@tags = Tag.alphabetical
  end

  def destroy
    target_tag = Tag.find(params[:id])
    tag_name = target_tag.tag_name
    target_tag.destroy
    flash[:confirmation] = "#{tag_name} deleted."
    redirect_to tags_url
  end
end

