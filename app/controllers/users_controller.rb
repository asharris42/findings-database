class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :new, :create, :destroy, :index, :show]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:confirmation] = "New user created!"
  		redirect_to users_url
  	else
  		render 'new'
  	end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      if current_user?(@user)
      	sign_in @user
      end
      flash[:confirmation] = "User updated."
      redirect_to users_url
    else
      render 'edit'
    end
  end

  def destroy
  	User.find(params[:id]).destroy
    flash[:confirmation] = "User deleted."
    redirect_to users_url
  end

  def index
  	@users = User.alphabetical.paginate(page: params[:page])
  end

  def show
  	@user = User.find(params[:id])
  end
end
