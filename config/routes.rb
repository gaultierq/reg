Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  namespace :admin do
    resources :faucets do
      member do
        get 'duplicate'
        get 'archive_admin'
        get 'templatize'
      end
    end

    resources :attachments
    resources :tap_templates do
      member do
        get 'new_from_params'
      end
    end

    resources :industrial_units do
      collection do
        get 'index_mobile'
      end
    end
    resources :events
    resources :alerts
    resources :peoples, only: :index
    resources :admins, except: :index
    resources :users, except: :index do
      member do
        post :unlock
      end
    end

    root 'industrial_units#index'
  end

  namespace :user do
    resources :industrial_units, only: %i[index show]
    resources :faucets, only: %i[index show edit update] do
      member do
        get 'archive_user'
      end
    end
    resources :events
    resources :users, only: %i[edit update]

    root 'faucets#index'
  end

  resources :registration, only: %i[new create]

  root 'admin/industrial_units#index'
end
