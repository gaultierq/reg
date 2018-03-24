Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  namespace  :admin do
    resources :taps
    resources :tap_templates
    resources :industrial_units
    resources :events
    resources :peoples, only: :index
    resources :admins, except: :index
    resources :users, except: :index

    root 'industrial_units#index'
  end

  namespace :user do
    resources :taps, only: [:index, :show]

    root 'taps#index'
  end

  root 'admin/industrial_units#index'
end
