Rails.application.routes.draw do
  root to: 'industrial_units#index'

  resources :industrial_units
end
