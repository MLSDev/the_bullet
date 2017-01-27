module Api
  module V1
    module Docs
      class Profiles
        # :nocov:
        include Swagger::Blocks

        swagger_path '/profile' do
          operation :get do
            key :summary, 'Profile'
            key :description, 'Get user profile'
            key :tags, ['profile']
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
              schema do
                key :'$ref', :OutputUser
              end
            end
            extend Api::V1::Docs::Shared::SwaggerUnauthorized
          end
        end
        # :nocov:
      end
    end
  end
end
