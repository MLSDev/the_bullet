Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :docs, only: :index

      resource :sign_up, only: :create

      resource :sign_in, only: :create

      resource :sign_out, only: :destroy

      resource :profile, only: :show

      resource :request_password_reset, only: :create

      resource :password_reset, only: :create
    end
  end
end
