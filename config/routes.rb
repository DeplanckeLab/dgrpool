Rails.application.routes.draw do
  resources :studies
  devise_for :users
  resources :phenotypes
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

    root "home#welcome"


end
