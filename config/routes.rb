Rails.application.routes.draw do
  resources :group_entities
  devise_for :users
  resources :users 
  resources :groups do
  resources :entities
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    get '/splashscreen/index', to: 'splashscreen#index'
  # Defines the root path route ("/")
   #root "splashscreen#index"

   unauthenticated do 
    root "splash_screen#index"
   end

   authenticated :user do
    root 'groups#index',as: :authenticated_root
   end

end
