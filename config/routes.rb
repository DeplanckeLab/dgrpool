Rails.application.routes.draw do
  resources :journals
  resources :statuses
  resources :studies
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :phenotypes
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

    root "home#welcome"


end
