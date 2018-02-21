Rails.application.routes.draw do

  root to: 'home#index'

  get '/products', to: 'products#index', as: 'products'
  get '/products/new', to: 'products#new', as: 'new_product'
  get '/products/:id', to: 'products#show', as: 'product'
  post '/products', to: 'products#create', as: 'create_product'
  delete '/products/:id', to: 'products#destroy', as: 'destroy_product'

  get '/products/:id/edit', to: 'products#edit', as: 'edit_product'
  patch '/products/:id', to: 'products#update', as: 'update_product'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
