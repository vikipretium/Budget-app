Rails.application.routes.draw do
  devise_for :users
  resources :users do
  resources :groups
  resources :entities
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    get '/splashscreen/index', to: 'splashscreen#index'
  # Defines the root path route ("/")
   root "splashscreen#index"
end
