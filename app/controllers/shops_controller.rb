class ShopsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    #@shops = Shop.all
    @shops = Shop.order("created_at DESC").paginate(page: params[:page], per_page:5)
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = current_user.shops.create(shop_params)
    if @shop.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @shop = Shop.find(params[:id])
    @comment = Comment.new
    @photo = Photo.new
  end

  def edit
    @shop = Shop.find(params[:id])

    if @shop.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end

    @shop.update_attributes(shop_params)
    if @shop.valid?
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    if @shop.user =! current_user
      return render text: 'Not Allowed', status: :forbidden
    end

    @shop.destroy
    redirect_to root_path
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :description, :address)
  end
end
