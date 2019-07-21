Rails.application.routes.draw do
  root 'sessions#new'

  resources :users, only: [:new, :create, :destroy]
  resources :resources
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
