class PhotosController < ApplicationController
  before_action :authenticate_user!

  def create
    @shop = Shop.find(params[:shop_id])
    @shop.photos.create(photo_params.merge(user: current_user))
    redirect_to shop_path(@shop)
  end

  def show
    render template: :photo
  end

  private

  def photo_params
    params.require(:photo).permit(:picture, :caption)
  end
end
