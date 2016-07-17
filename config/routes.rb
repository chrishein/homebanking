Rails.application.routes.draw do
  devise_for :users

  resources :accounts do
    resources :account_movements
    resources :import_account_movements, only: [:new, :create]
  end
  resources :clients do
    resources :accounts
  end

  root to: 'visitors#index'
end
