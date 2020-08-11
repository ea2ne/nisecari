Rails.application.routes.draw do
  root 'items#edit'
  resources :items do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    collection do
      get 'get_category_cildren', defaults:{ format: 'json'}
      get 'get_category_grandcildren', defaults:{ format: 'json'}
      get 'search'
      get 'post_done'
      get 'delete_done'
      get 'detail_search'
      get 'update_done'
    end
  end
end
