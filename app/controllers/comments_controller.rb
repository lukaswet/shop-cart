class CommentsController < ApplicationController
  before_action :set_product

  def index
    @comments = @product.comments
    @comment = @product.comments.new
  end

  def create
    @comment = @product.comments.new(comment_params)
    if @comment.save
      redirect_to product_comments_path(@product)
    else
      @comments = @product.comments
      render :index
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def comment_params
    params.require(:comment).permit(:nickname, :text)
  end
end
