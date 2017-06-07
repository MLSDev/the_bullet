Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    resources :docs, only: :index

    resource :sign_up, only: :create

    resource :sessions, only: [:create, :destroy]

    resource :profile, only: :show

    resource :request_password_reset, only: :create

    resource :password_reset, only: :create
  end

  namespace :backoffice, defaults: { format: 'json' } do
    resources :docs, only: :index

    resource :sessions, only: [:create, :destroy]

    resources :users, only: [:index, :create, :show, :update, :destroy]
  end
end
