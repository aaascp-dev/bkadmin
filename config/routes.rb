Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'glass_types#index'

  resources :glass_types, :only => [:index, :create, :destroy]
end
