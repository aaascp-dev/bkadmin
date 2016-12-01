Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :glass_types, except: [:new, :show]
  resources :beer_types, except: [:new, :show]
  resources :extra_types, except: [:new, :show]
  resources :providers, except: [:new, :show]
  resources :packages, except: [:new, :show]
  resources :beer_characteristics, except: [:new, :show]
  resources :beers
  resources :glasses, except: [:show]

  resources :clients do
    resources :addresses
  end

  resources :sessions, only: [:create, :destroy]
  resources :login, only: [:index]

  root 'login#index'
end
