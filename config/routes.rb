Rails.application.routes.draw do
  devise_for :users
  resources :shops do
    resources :comments, only: :create
    resources :photos, only: :create
  end
  resources :users, only: :show
  resources :index do
    resources :photos, only: :show
  end
  root "static_pages#index"
    get 'privacy', to: 'static_pages#privacy'
    get 'team', to: 'static_pages#team'
    get 'career', to: 'static_pages#career'
    get 'about', to: 'static_pages#about'
    get 'faq', to: 'static_pages#faq'
    get 'contact', to: 'static_pages#contact'
end
