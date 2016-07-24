Rails.application.routes.draw do
  devise_for :users
  scope "/admin" do
    resources :users
  end

  resources :accounts do
    resources :account_movements
    resources :import_account_movements, only: [:new, :create]
  end
  resources :clients do
    resources :accounts
  end

  root to: 'visitors#index'
end
