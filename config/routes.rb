Rails.application.routes.draw do
  devise_for :property_owners
  get 'regions/property_location'
  root to:  'home#index'
  resources :properties, only: [:index, :show, :new, :create] do
    get 'my_properties', on: :collection
  end
  resources :property_types, only: [:index, :new, :create, :show]
  resources :regions, only: [:index, :new, :create, :show]
end
