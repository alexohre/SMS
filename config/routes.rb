Rails.application.routes.draw do

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }, path: 'auth', path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      password: 'secret',
      confirmation: 'verification',
      unlock: 'unblock',
      registration: 'register',
      sign_up: 'new'
    }

  devise_scope :user do
    # Use auth layout for every page except for edit user registration page
    get '/users/*path', to: 'application#auth', constraints: ->(request){ request.path.exclude? 'edit' }

    # Use admin layout for edit user registration page
    get '/users/edit', to: 'users/registrations#edit', as: :edit_user_registration_path, format: false, defaults: { format: :html }
  end

  
  namespace :admin do
    resources :tickets
    resources :events
    resources :categories
    get 'dashboard', to: 'dashboard#index'
    get 'analytics', to: 'dashboard#analytics'
    get 'staffs', to: 'dashboard#staffs'
    get 'profile', to: 'dashboard#profile'
    get 'transactions', to: 'dashboard#transactions'
  end
  root 'pages#index'
  get 'contact', to: 'pages#contact'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

