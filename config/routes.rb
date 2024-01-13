Rails.application.routes.draw do
  # Define my API routes
  namespace :api, defaults: { format: 'json' } do
    resources :logs, :only => [:index]
  end
  
  # Define my application routes 
  resources :page, :only => [:index]

  # Defines the root path route ("/")
  root "page#index"
end
