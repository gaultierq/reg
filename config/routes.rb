Rails.application.routes.draw do
  resources :tap_templates
  root to: 'industrial_units#index'

  resources :industrial_units
end
