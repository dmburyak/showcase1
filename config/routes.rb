Rails.application.routes.draw do

  devise_for :admins

  root 'phones#index'

  resources :images

  resources :phones do
    match 'search' => 'phones#search',
          on: :collection, via: [:get, :post], as: :search
  end

  resources :property_groups
  resources :properties
  resources :property_values
  resources :sellers

end
