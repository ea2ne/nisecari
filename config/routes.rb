Rails.application.routes.draw do
  root 'items#index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
    get 'sending_destination', to: 'users/registrations#new_sending_destination'
    post 'sending_destination', to: 'users/registrations#create_sending_destination'
  end
  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get 'buy'
      post 'pay'
    end
  end
  resources :users, only: :show
  resources :credit_cards, only: [:new, :create, :show, :destroy]
end
