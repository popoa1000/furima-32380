Rails.application.routes.draw do
  get 'orders/index'
  devise_for :users
  get 'items/index'
  root to: "items#index"
  resources :users, only: [:new, :create]
  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :orders, only: [:index, :new, :create]
  end

end
