class ProductsController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :new, :create, :destroy]

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(params[:product])
    if @product.save
      flash[:confirmation] = "#{@product.product_name} created!"
      redirect_to products_url
    else
      render 'new'
    end
	end

	def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      flash[:confirmation] = "#{@product.product_name} updated."
      redirect_to products_url
    else
      render 'edit'
    end
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
