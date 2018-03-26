class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy, :edit, :update]
  before_action :increment_prod, only: :show

	def index
    @q = Product.ransack(params[:q])
    @products = @q.result.order('updated_at DESC')

    # @per_page = params[:per_page].present? ? params[:per_page].to_i : 5
    @page = params[:page].present? ? params[:page].to_i : 1

    @products = @products.page(@page)
    respond_to do |format|
      format.html
      format.json { render :index }
    end
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

  def increment_prod
    @product.view.increment
  end
end
