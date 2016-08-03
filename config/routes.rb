Rails.application.routes.draw do

  resources :users, except: :index
  resources :items
  resources :categories
  resources :ordered_items, only: [:create, :update, :destroy]
  resources :checkouts

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/register', to: 'users#new'

  get '/my_cart', to: 'orders#basket'
  put '/basket', to: 'orders#update'
  get '/thank_you', to: 'orders#thank_you'

  resources :orders, only: [:update, :index]

  root 'categories#index'

  get '/admin', to: 'admins#index'

end
