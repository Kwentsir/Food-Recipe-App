Rails.application.routes.draw do
  resources :recipes
  resources :recipe_foods
  devise_for :users
  resources :foods
  resources :inventories do
    resources :inventory_foods
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
