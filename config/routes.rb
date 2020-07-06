Rails.application.routes.draw do
  root 'homes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items, only: [:index, :show]
  devise_for :users
  resources :users, only: [:show]
end
