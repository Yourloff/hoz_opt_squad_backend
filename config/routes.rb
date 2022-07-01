Rails.application.routes.draw do
  resource :clients, only: [:create]

  post '/login', to: 'clients#login'
  get '/auto_login', to: 'clients#auto_login'
end
