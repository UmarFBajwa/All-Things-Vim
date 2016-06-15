Rails.application.routes.draw do
  get 'users/new'

  get 'items/index'

  resources :items

  root 'items#index'

  get '/admin', to: 'admins#index'

end
