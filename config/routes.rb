Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
    get 'sending_destination', to: 'users/registrations#new_sending_destination'
    post 'sending_destination', to: 'users/registrations#create_sending_destination'
  end
  resources :items ,only: [:index, :show, :new, :edit, :update, :destroy] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :items, excect: :show

  resources :searches,only:[:index]
  
  resources :items, only: :show do
  end
  root 'items#index'


  resources :items do
    collection do
      match 'search' => 'items#search', via: [:get, :post]
    end
  
    member do
      get 'buy'
      post 'pay'
    end
  end
  resources :users, only: :show
  resources :credit_cards, only: [:new, :create, :show, :destroy]
end
