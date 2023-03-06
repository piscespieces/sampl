Rails.application.routes.draw do
  resources :samples
  resources :sample_packs
  devise_for :artists
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "home#index"
end
