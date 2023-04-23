Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'new' }
  namespace :admin do
    resources :tickets
    resources :events
    resources :categories
    get 'dashboard', to: 'dashboard#index'
    get 'analytics', to: 'dashboard#analytics'
    get 'staffs', to: 'dashboard#staffs'
    get 'transactions', to: 'dashboard#transactions'
  end
  root 'pages#index'
  get 'contact', to: 'pages#contact'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
