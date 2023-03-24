Rails.application.routes.draw do
  # post '/login', to: 'users#login'
  # get '/verify_token', to: 'users#verify_token'
  # delete '/logout', to: 'users#logout'
  get '/signup', to: 'users#new'
  resources :users
end
