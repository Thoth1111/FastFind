Rails.application.routes.draw do
  # Define my API routes
  namespace :api, defaults: { format: 'json' } do
    resources :logs, only: [] do
      collection do
        post '/save_log', to: 'logs#save_log' 
        get 'search_log', to: 'logs#search_log'
      end
    end
  end
  
  # Define my application routes 
  resources :page, :only => [:index]

  # Defines the root path route ("/")
  root "page#index"
end
