Rails.application.routes.draw do
  devise_for :admins
  devise_for :technicians

  scope 'admin' do
    resources :taps
    resources :tap_templates
    resources :industrial_units
  end

  namespace :technician do
  end

  root 'admin/industrial_units#index'
end
