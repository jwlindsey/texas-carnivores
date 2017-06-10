class ShopsController < ApplicationController
  def index
    @shops = Shop.all
    @shops = Shop.order("created_at DESC").paginate(page: params[:page], per_page:5)
  end

  def new

  end
end
