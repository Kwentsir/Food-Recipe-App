Rails.application.routes.draw do
  devise_for :users
  resources :foods
  resources :public_recipes, only: [:index]
  resources :recipes do
    resources :recipe_foods
  end
  resources :inventories do
    resources :inventory_foods
  end

  resource :shopping_lists, only: [:index]
  get 'recipes/:recipe_id/generate_shopping_list', :to => 'shopping_lists#new'
  post 'recipes/:recipe_id/generate_shopping_list', :to => 'shopping_lists#create'
  get 'shopping_list/:recipe_id/:inventory_id', :to => 'shopping_lists#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
