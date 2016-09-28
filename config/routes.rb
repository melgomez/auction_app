Rails.application.routes.draw do

  resources :bids

  resources :items do
    resources :bids, only: [:index, :new, :create, :update]
  end

  get "signup", to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'items#index'

  resources :users
  resources :sessions

end
