Rails.application.routes.draw do
  devise_for :users

  resources :account_movements
  resources :accounts
  resources :clients

  root to: 'visitors#index'
end
