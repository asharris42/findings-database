class ProductsController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :new, :create, :destroy]

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(params[:product])
    if @product.save
      flash[:confirmation] = "New product created!"
      redirect_to products_url
    else
      render 'new'
    end
	end

	def edit
	end

	def update
	end

  def show
  	@product = Product.find(params[:id])
    @studies = @product.studies.by_date.paginate(page: params[:page])
  end

  def index
  	@products = Product.alphabetical
  end

  def destroy
  	Product.find(params[:id]).destroy
    flash[:confirmation] = "Product deleted."
    redirect_to products_url
  end
end
