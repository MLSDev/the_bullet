# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    resources :docs, only: :index
    resource :sessions, only: [:create, :destroy]

    resource :profile, only: [:create, :show]

    resource :forgot_password, only: :create

    resource :set_new_password, only: :create
  end

  namespace :backoffice, defaults: { format: 'json' } do
    resources :docs, only: :index

    resource :sessions, only: [:create, :destroy]

    resources :users, only: [:index, :create, :show, :update, :destroy]
  end
end
