Rails.application.routes.draw do
  resources :property_groups

  root to: 'items#index'

  devise_for :admins

  resources :items
  resources :properties
  resources :property_values
  resources :sellers

end
