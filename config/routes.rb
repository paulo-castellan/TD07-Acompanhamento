Rails.application.routes.draw do
  devise_for :property_owners
  get 'regions/property_location'
  root to:  'home#index'
  resources :properties, only: [:show, :new, :create]
  resources :property_types, only: [:index, :new, :create, :show]
  resources :regions, only: [:index, :new, :create, :show]
end
