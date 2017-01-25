module Api
  module V1
    module Docs
      class SignOuts
        # :nocov:
        include Swagger::Blocks

        swagger_path '/sign_out' do
          operation :delete do
            key :summary, 'Sign out'
            key :description, 'Sign out user'
            key :tags, ['sign out']
            parameter do
              key :name, 'Authorization'
              key :in, :header
              key :description, 'User auth token. Example: Bearer AAkoMiLatQHMngyuUU1vnh5b'
              key :default, 'Bearer ACCESS_TOKEN'
              key :required, true
              key :type, :string
            end
            response '200' do
              key :description, 'Success'
            end
            response '401' do
              key :description, 'Unauthorized'
            end
          end
        end
        # :nocov:
      end
    end
  end
end
