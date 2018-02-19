class ProductsController < ApplicationController

	def index
    @products = Product.all
	end

	def show
		@product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new
    @product.price = params[:price]
    @product.name = params[:name]
    @product.save

    redirect_to products_path
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to products_path
  end
end
