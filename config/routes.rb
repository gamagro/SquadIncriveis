Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  #resources :users

  match '/users',   to: 'users#index',   via: 'get'

  get 'pages/info'
  get "pages/info"
  
  resources :ideas

  root to: redirect('/ideas')

devise_scope :user do
  post '/checkemail', to: 'users#emailcheck'
  post '/checkcpf', to: 'users#cpfcheck'
  post '/checkcnpj', to: 'users#cnpjcheck'
end

end
