Rails.application.routes.draw do
  devise_for :artists
  devise_for :users
  
  resources :sample_tags
  resources :samples
  resources :sample_packs

  namespace :artists do
    resources :sample_packs
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "home#index"
end
