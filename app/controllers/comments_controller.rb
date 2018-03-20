class CommentsController < ApplicationController
  include Productable
  before_action :authenticate_user!

  def index
    @comments = @product.comments
    @comment = @product.comments.new
  end

  def create
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to product_comments_path(@product)
    else
      @comments = @product.comments
      render :index
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:nickname, :text)
  end
end
