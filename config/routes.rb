Rails.application.routes.draw do
  resources :taps
  resources :tap_templates
  resources :industrial_units do
    resources :taps, only: :index
  end

  root to: 'industrial_units#index'
end
