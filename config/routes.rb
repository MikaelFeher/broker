Rails.application.routes.draw do
  root 'products#index'

  resources :products

  mount Admin::Engine, at: "admin"

  end
