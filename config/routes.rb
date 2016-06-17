Rails.application.routes.draw do

  resources :users, except: :index
  resources :items
  resources :categories

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/register', to: 'users#new'

  root 'categories#index'

  get '/admin', to: 'admins#index'

end
