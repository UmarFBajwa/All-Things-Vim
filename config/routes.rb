Rails.application.routes.draw do

  resources :users
  resources :items
  resources :sessions

  get '/login'

  root 'items#index'

  get '/admin', to: 'admins#index'

end
