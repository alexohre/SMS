Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    invitations: 'users/invitations'
  }, path: 'auth', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    password: 'secret',
    confirmation: 'verification',
    unlock: 'unblock',
    registration: 'register',
    sign_up: 'new'
  }
  
  namespace :admin do
    get 'staffs', to: 'staff#index'
    get 'staffs/:id', to: 'staff#show'

    post '/invite', to: 'staff#invite', as: :invite
    resources :tickets
    resources :events
    resources :categories
    get 'dashboard', to: 'dashboard#index'
    get 'analytics', to: 'dashboard#analytics'
    get 'staffs', to: 'dashboard#staffs'
    get 'profile', to: 'dashboard#profile'
    get 'transactions', to: 'dashboard#transactions'
  end

  resources :events, only: [:index, :show]
  root 'pages#index'
  get 'contact', to: 'pages#contact'

  #sending email url
  post 'contact_action', to: 'pages#contact_action'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end

