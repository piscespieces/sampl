require "sidekiq/web"

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"
  devise_for :users
  resources :sample_tags
  resources :samples do
    post "like"
  end
  resources :sample_packs do
    get "download"
  end
  resources :likes, only: [:index]
  resources :artists, only: [:show, :edit, :update]

  # namespace :artists do
  #   resources :sample_packs
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "home#index"
  get "/status", to: "sample_packs#status"
end
