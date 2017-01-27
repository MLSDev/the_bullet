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
            parameter :authorization
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
