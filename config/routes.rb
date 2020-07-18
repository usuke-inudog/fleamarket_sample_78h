Rails.application.routes.draw do
  root 'homes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :items, only: [:index, :new, :show, :create, :update] do
    resources :purchase, only: [:show] do
      collection do
        # get "show", to: "purchase#show"
        post "pay", to: "purchase#pay"
        get "done", to: "purchase#done"
      end
    end
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  devise_for :users
  
  resources :profiles, only: [:index, :new, :create, :show, :edit, :update]
  
  resources :users, only: [:show] do
    resources :credit_cards
  end

  resources :categories, only: [:index, :show]
  
  resources :shipping_address, only: [:new, :edit]

end
