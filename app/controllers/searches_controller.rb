class SearchesController < ApplicationController

	def new
  	@search = Search.new
    @platforms = Platform.all
    @products = Product.all
	end

	def create
  	@search = Search.create!(params[:search])
  	redirect_to @search
	end

	def show
  	@search = Search.find(params[:id])
	end

end
