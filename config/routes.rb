Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: {
    registrations: 'devise/registrations'
  }

  namespace :admin do
    resources :faucets do
      member do
        get 'duplicate'
      end
    end

    resources :attachments
    resources :tap_templates
    resources :industrial_units
    resources :events
    resources :alerts
    resources :peoples, only: :index
    resources :admins, except: :index
    resources :users, except: :index

    root 'industrial_units#index'
  end

  namespace :user do
    resources :faucets, only: %i[index show]
    resources :events

    root 'faucets#index'
  end

  root 'admin/industrial_units#index'
end
