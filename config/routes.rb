Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  namespace :admin do
    resources :faucets do
      member do
        get 'duplicate'
      end
    end

    resources :attachments
    resources :tap_templates
    resources :industrial_units do
    collection do
      get 'index_mobile'
    end
  end
    resources :events
    resources :alerts
    resources :peoples, only: :index
    resources :admins, except: :index
    resources :users, except: :index

    root 'industrial_units#index'
  end

  namespace :user do
    resources :industrial_units, only: %i[index show]
    resources :faucets, only: %i[index show edit update]
    resources :events
    resources :users, only: %i[edit update]

    root 'faucets#index'
  end

  resources :registration, only: %i[new create]

  root 'admin/industrial_units#index'
end
