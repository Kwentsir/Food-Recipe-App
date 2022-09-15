Rails.application.routes.draw do
  resources :inventories
  resources :recipe_foods
  resources :recipes
  devise_for :users
  resources :foods
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
