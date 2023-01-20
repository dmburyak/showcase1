Rails.application.routes.draw do
  resources :property_groups

  devise_for :admins

  root "items#index"

  resources :items
  resources :properties
  resources :property_values
  resources :sellers

end
