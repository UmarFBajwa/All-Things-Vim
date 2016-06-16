Rails.application.routes.draw do

  resources :users
  resources :items
  resources :categories
  # resources :sessions

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root 'items#index'

  get '/admin', to: 'admins#index'

end
