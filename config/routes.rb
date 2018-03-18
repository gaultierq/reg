Rails.application.routes.draw do
  constraints subdomain: 'admin' do
    devise_for :admins

    scope module: 'admin' do
      resources :taps
      resources :tap_templates
      resources :industrial_units
    end

    get '/', to: 'admin/industrial_units#index'
  end

  constraints subdomain: 'technician' do
    devise_for :technicians

    scope module: 'technician' do
    end

    get '/', to: 'technician/taps#index'
  end

  root 'admin/industrial_units#index'
end
