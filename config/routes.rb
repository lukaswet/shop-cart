Rails.application.routes.draw do
  mount Api => '/'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :users, only: [:update] do
    collection do
      get :me
    end
  end

  devise_for :users
  root to: 'home#index'

  resources :products do
    resources :comments
    resources :images
    resources :likes, only: [] do
      collection do
        put :like
        put :unlike
      end
    end
  end

  # get '/products', to: 'products#index', as: 'products'
  # get '/products/new', to: 'products#new', as: 'new_product'
  # get '/products/:id', to: 'products#show', as: 'product'
  # post '/products', to: 'products#create', as: 'create_product'
  # delete '/products/:id', to: 'products#destroy', as: 'destroy_product'
  #
  # get '/products/:id/edit', to: 'products#edit', as: 'edit_product'
  # patch '/products/:id', to: 'products#update', as: 'update_product'
  #
  # resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
