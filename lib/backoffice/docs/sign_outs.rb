module Backoffice
  module Docs
    class SignOuts
      # :nocov:
      include Swagger::Blocks

      swagger_path '/sign_out' do
        operation :delete do
          key :summary, 'Sign out superuser'
          key :description, 'Sign out superuser'
          key :tags, ['sign out']
          parameter :authorization
          response '200' do
            key :description, 'Success'
          end
          extend Backoffice::Docs::Shared::Unauthorized
        end
      end
      # :nocov:
    end
  end
end
