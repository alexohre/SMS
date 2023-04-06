Rails.application.routes.draw do
  namespace :admin do
    resources :events
    resources :categories
    get 'dashboard', to: 'dashboard#index'
    get 'analytics', to: 'dashboard#analytics'
  end
  root 'pages#index'
  get 'contact', to: 'pages#contact'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
