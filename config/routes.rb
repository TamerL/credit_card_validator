# frozen_string_literal: true

Rails.application.routes.draw do
  resources :credit_cards, only: [:index, :new, :create, :show, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'credit_cards#index'
end
