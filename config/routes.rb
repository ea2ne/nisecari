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

  root 'items#new'
  resources :items, excect: :show
  resources :items do
    get 'buy'
    get 'pay'
  end
  resources :users, only: :show
  resources :credit_cards, only: [:new, :create, :show, :destroy]
end
