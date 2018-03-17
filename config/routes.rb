Rails.application.routes.draw do

  scope '/admin' do
    resources :taps
    resources :tap_templates
    resources :industrial_units
  end

  scope '/technician' do
  end

  root to: 'industrial_units#index'
end
