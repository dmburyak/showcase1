Rails.application.routes.draw do

  devise_for :admins

  root "items#index"

  resources :images
  resources :items
  resources :property_groups
  resources :properties
  resources :property_values
  resources :sellers

end
