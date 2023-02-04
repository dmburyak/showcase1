Rails.application.routes.draw do

  devise_for :admins

  root "phones#index"

  resources :images
  resources :phones
  resources :property_groups
  resources :properties
  resources :property_values
  resources :sellers

end
