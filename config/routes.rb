Rails.application.routes.draw do

  resources :users
  resources :items

  root 'items#index'

  get '/admin', to: 'admins#index'

end
