class ShopsController < ApplicationController
  def index
    @shops = Shop.all
    @shops = Shop.order("created_at DESC").paginate(page: params[:page], per_page:5)
  end

  def new
    @shop = Shop.new
  end

  def create
    Shop.create(shop_params)
    redirect_to root_path
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :description, :address)
  end
end
