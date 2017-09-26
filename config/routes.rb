Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/login", to: "sessions#new"  
  # post "/login", "sessions#create"  
  # post "/logout", "sessions#destroy"  

  # get "/register", "users#new"
  # post "/register", "users#create"  

  root 'todos#index'
  resources :todos
  # resources :users, only: [:show, :edit, :update]
end
