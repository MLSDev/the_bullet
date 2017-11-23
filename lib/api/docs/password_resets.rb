# frozen_string_literal: true

module Api
  module Docs
    class PasswordResets
      # :nocov:
      include Swagger::Blocks

      swagger_path '/password_reset' do
        operation :post do
          key :summary, 'Password reset'
          key :description, 'Password reset. On success, remove all user sessions, create new session and return it.'
          key :tags, ['password reset']
          parameter do
            key :name, :reset_token
            key :in, :formData
            key :required, true
            key :type, :string
            key :description, 'User reset token'
          end
          parameter do
            key :name, :password
            key :in, :formData
            key :required, true
            key :type, :string
            key :format, :password
            key :description, 'New user password'
          end
          parameter do
            key :name, :password_confirmation
            key :in, :formData
            key :required, true
            key :type, :string
            key :format, :password
            key :description, 'New user password confirmation'
          end
          response '200' do
            key :description, 'Success'
            schema do
              key :'$ref', :OutputSession
            end
          end
          extend Api::Docs::Shared::UnprocessableEntity
        end
      end
      # :nocov:
    end
  end
end
