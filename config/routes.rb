Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resource :sign_up, only: :create

      resource :sign_in, only: :create

      resource :sign_out, only: :destroy

      resource :profile, only: :show
    end
  end
end
