Rails.application.routes.draw do
  # Define my API routes
  namespace :api do
    resources :logs do
      collection do
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
