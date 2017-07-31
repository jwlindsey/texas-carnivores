class StaticPagesController < ApplicationController
  def index
    #@shops = Shop.all
    @shops = Shop.order("created_at DESC").paginate(page: params[:page], per_page:5)
  end

  def career

  end

  def privacy

  end

  def team

  end

  def about

  end

  def faq

  end

  private

  def shop_params
    params.require(:shop).permit(:name, :description, :address)
  end
end
