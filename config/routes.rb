Rails.application.routes.draw do

  resources :users, except: :index
  resources :items
  resources :categories
  resources :ordered_items, only: [:create, :update, :destroy]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/register', to: 'users#new'

  get '/my_cart', to: 'orders#basket'
  put '/checkout', to: 'orders#update'

  root 'categories#index'

  get '/admin', to: 'admins#index'

end
