# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: [:index, :destroy, :new, :create] do
    resources :credit_cards, only: [:index, :new, :create, :show, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
end
