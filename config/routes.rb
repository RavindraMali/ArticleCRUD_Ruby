Rails.application.routes.draw do
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "articles#index"

  devise_for :users
  
  resources :articles do
      resources :comments
  end

  # get "/article", to: "articles#index"

end
