Rails.application.routes.draw do
  resources :orders
  resource :clients, only: [:create]

  post '/login', to: 'clients#login'
  get '/auto_login', to: 'clients#auto_login'

  post '/upload', to: 'files#upload_pricelist'

  resources :categories
  resources :subcategories
  resources :products

  get 'basket_products/show', to: 'basket_products#show'
  post 'basket_products/add', to: 'basket_products#add'
  delete 'basket_products/remove', to: 'basket_products#remove'
end
