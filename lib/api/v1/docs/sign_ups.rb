module Api
  module V1
    module Docs
      class SignUps
        # :nocov:
        include Swagger::Blocks

        swagger_path '/sign_up' do
          operation :post do
            key :summary, 'Sign up'
            key :description, 'Sign up new user'
            key :tags, ['sign up']
            parameter do
              key :name, :email
              key :in, :formData
              key :required, true
              key :type, :string
              key :description, 'User email'
            end
            parameter do
              key :name, :password
              key :in, :formData
              key :required, true
              key :type, :string
              key :format, :password
              key :description, 'User password'
            end
            parameter do
              key :name, :password_confirmation
              key :in, :formData
              key :required, true
              key :type, :string
              key :format, :password
              key :description, 'User password confirmation'
            end
            response '200' do
              key :description, 'Success'
              schema do
                key :'$ref', :OutputSession
              end
            end
            extend Api::V1::Docs::Shared::SwaggerUnprocessableEntity
          end
        end
        # :nocov:
      end
    end
  end
end
