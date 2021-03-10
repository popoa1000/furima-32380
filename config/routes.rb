Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  root to: "items#index"
  resources :users, only: [:new, :create]
  resources :items, only: [:index, :new, :create]

end
