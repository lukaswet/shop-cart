class Api < Grape::API
  format :json
  prefix :api

  resources :users do
    get do
      { hello: 'Lukas' }
    end

    get 'all' do
      'All'
    end

    params do
      requires :key, type: Boolean
      optional :key_2, type: String
    end

    get 'params' do
      # /api/users/params?key=false&key_2=sdsdasd
      { key: params[:key], key_2: params[:key_2] }
    end
  end
end