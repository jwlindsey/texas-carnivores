class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @shop = Shop.find(params[:shop_id])
    @shop.comments.create(comment_params.merge(user: current_user))
    redirect_to shop_path(@shop)
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :rating)
  end
end
