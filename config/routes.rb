Rails.application.routes.draw do
  devise_for :users
  #resources :users

  get 'pages/info'
  get "pages/info"
  
  resources :ideas

  root to: redirect('/ideas')
end
