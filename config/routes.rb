Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'todos#index'

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"

  get "/register", to: "users#new", as: :new_user
  post "/register", to: "users#create", as: :users

  resources :todos
  resources :users, only: [:show, :edit, :update]
end
