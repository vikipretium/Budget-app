Rails.application.routes.draw do
  resources :users do
  resources :groups
  resources :entities
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    get '/splashscreen/index', to: 'splashscreen#index'
  # Defines the root path route ("/")
   root "splashscreen#index"
end
