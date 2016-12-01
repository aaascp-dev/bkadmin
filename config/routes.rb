Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :glass_types, only: [:index, :create, :destroy, :update, :edit]
  resources :beer_types, only: [:index, :create, :destroy, :update, :edit]
  resources :extra_types, only: [:index, :create, :destroy, :update, :edit]
  resources :providers, only: [:index, :create, :destroy, :update, :edit]
  resources :packages, only: [:index, :create, :destroy, :update, :edit]
  resources :beer_characteristics, only: [:index, :create, :destroy, :update, :edit]
  resources :beers, only: [:index, :new, :create, :update, :show, :edit, :destroy]
  resources :glasses, only: [:index, :new, :create, :update, :edit, :destroy]
  resources :sessions, only: [:create, :destroy]
  resources :login, only: [:index]

  root 'login#index'
end
