Rails.application.routes.draw do
    
  devise_for :admins

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  root 'products#index'

  resources :products

  end
