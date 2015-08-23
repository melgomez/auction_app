Rails.application.routes.draw do

  resources :bids

  resources :items

  get "signup", to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'users#index'

  resources :users
  resources :sessions

end
