class ProductsController < ApplicationController

	def index
    @page = params[:page].present? ? params[:page].to_i : 1
    @products = Product.page(@page)

    # @products = Product.all
    # @products = Product.page(7).per(50)
	end

	def show
		@product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new
    @product.price = params[:product][:price]
    @product.name = params[:product][:name]
    @product.save

    redirect_to products_path
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    if request.xhr?
      head :no_content
    else
      redirect_to products_path
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes(product_params)

    redirect_to products_path
  end

  private

    def product_params
      params.require(:product).permit(:name, :price)
    end
end
