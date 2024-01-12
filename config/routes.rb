Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :logs, :only => [:index]

  # Defines the root path route ("/")
  root "logs#index"
end
