class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy, :edit, :update]

	def index
    @page = params[:page].present? ? params[:page].to_i : 1
    @products = Product.page(@page)

    # @products = Product.all
    # @products = Product.page(7).per(50)
	end

	def show
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)

    redirect_to products_path
  end

  def destroy
    @product.destroy
    if request.xhr?
      head :no_content
    else
      redirect_to products_path
    end
  end

  def edit
  end

  def update
    @product.update_attributes(product_params)

    redirect_to products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, images_attributes: [:file])
  end
end
