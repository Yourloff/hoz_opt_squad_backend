Rails.application.routes.draw do
  resources :orders
  resource :clients, only: [:create]
  post '/login', to: 'clients#login'
  get '/auto_login', to: 'clients#auto_login'

  resources :categories do
    resources :subcategories
  end

  resources :products
end
