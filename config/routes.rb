Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
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
