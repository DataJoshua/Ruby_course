Rails.application.routes.draw do
 
  resources :articles
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "home#index"
  post "/about", to: "home#about"
  get "/about" , to: "home#about"
  #SESIONS

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "login", to: "sessions#destroy"

  resources :users, except: %i[new create]
  # Defines the roots path route ("/")
  # root "articles#index"
end
