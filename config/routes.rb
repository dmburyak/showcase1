Rails.application.routes.draw do

  devise_for :admins

  root 'phones#index'

  resources :images

  resources :phones do
    match 'search' => 'phones#search',
          on: :collection, via: [:get, :post], as: :search
    match 'filter' => 'phones#filter',
          on: :collection, via: [:get, :post], as: :filter
  end

  resources :property_groups
  resources :properties
  resources :property_values

  resources :sellers do
    get 'goods', to: 'sellers#goods'
    post 'goods', to: 'models#get_models'
  end

end
