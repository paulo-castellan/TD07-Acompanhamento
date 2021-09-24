Rails.application.routes.draw do
  root to:  'home#index'
  resources :properties, only: [:show, :new, :create]
  resources :property_types, only: [:index, :new, :create]
end
