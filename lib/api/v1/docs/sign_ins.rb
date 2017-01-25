module Api
  module V1
    module Docs
      class SignIns
        # :nocov:
        include Swagger::Blocks

        swagger_path '/sign_in' do
          operation :post do
            key :summary, 'Sign in'
            key :description, 'Sign in user'
            key :tags, ['sign in']
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
              key :description, 'User password'
            end
            response '200' do
              key :description, 'Success'
              schema do
                key :'$ref', :OutputSession
              end
            end
            response '422' do
              key :description, 'Unprocessable Entity'
              schema do
                key :'$ref', :UnprocessableEntity
              end
            end
          end
        end
        # :nocov:
      end
    end
  end
end
