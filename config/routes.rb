Rails.application.routes.draw do
  devise_for :admins
  devise_for :technicians

  namespace  :admin do
    resources :taps
    resources :tap_templates
    resources :industrial_units
    resources :events
    resources :users, only: :index
    resources :admins, except: :index
    resources :technicians, except: :index

    root 'industrial_unit#index'
  end

  namespace :technician do
  end

  root 'admin/industrial_units#index'
end
