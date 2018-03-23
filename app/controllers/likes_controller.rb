class LikesController < ApplicationController
  before_action :set_product

  def like
    @result = @resource.add_like!(current_user)
    redirect_to products_path
  end

  def unlike
    @result = @resource.unlike!(current_user)
    redirect_to products_path
  end

  private

  def set_product
    @resource = if params[:product_id].present?
                  Product.find params[:product_id]
                end
  end


end