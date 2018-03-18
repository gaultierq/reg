Rails.application.routes.draw do

  devise_for :admins
  devise_for :technicians

  scope '/admins' do
    resources :taps
    resources :tap_templates
    resources :industrial_units
  end

  scope '/technician' do
  end

  root to: 'industrial_units#index'
end
