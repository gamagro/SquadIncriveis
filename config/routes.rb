Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  #resources :users

  match '/users',   to: 'users#index',   via: 'get'

  get 'pages/info'
  get "pages/info"
  
  resources :ideas

  root to: redirect('/ideas')
end
