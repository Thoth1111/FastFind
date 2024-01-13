Rails.application.routes.draw do
  # Define my API routes
  namespace :api, defaults: { format: 'json' } do
    resources :logs, only: [] do
      collection do
        get :index
        post :save_log
        get :search_log
      end
    end
  end
  
  # Define my application routes 
  resources :page, :only => [:index]

  # Defines the root path route ("/")
  root "page#index"
end
