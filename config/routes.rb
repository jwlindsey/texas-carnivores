Rails.application.routes.draw do
  devise_for :users
  root 'shops#index'
  resources :shops do
    resources :comments, only: :create
    resources :photos, only: :create
  end
  resources :users, only: :show
  resources :index do
    resources :photos, only: :show
  end
end
