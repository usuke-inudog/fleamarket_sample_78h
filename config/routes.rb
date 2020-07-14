Rails.application.routes.draw do
  root 'homes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items, only: [:index, :new, :show]
  devise_for :users
  resources :profiles, only: [:index, :new, :create, :show, :edit, :update]
  resources :users, only: [:show] do
    resources :credit_cards
  end
  resources :categories, only: [:index, :show]
end
