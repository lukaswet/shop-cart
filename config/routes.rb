Rails.application.routes.draw do

  root to: 'home#index'

  get '/products', to: 'products#index', as: 'products'
  get '/products/:id', to: 'products#show', as: 'product'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
