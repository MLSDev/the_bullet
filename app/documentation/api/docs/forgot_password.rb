# frozen_string_literal: true

class Api::Docs::ForgotPassword
  # :nocov:
  include Swagger::Blocks

  swagger_path '/forgot_password' do
    operation :post do
      key :summary, 'Forgot Password'
      key :description, 'Request password reset. On success, send email to user with instruction.'
      key :tags, ['Forgot Password']
      parameter do
        key :name, :email
        key :in, :formData
        key :required, true
        key :type, :string
        key :description, 'User email'
      end
      response '201' do
        key :description, 'Created'
      end
      extend Api::Docs::Shared::UnprocessableEntity
    end
  end

  swagger_path '/set_new_password' do
    operation :post do
      key :summary, 'Set new password'
      key :description, 'Set new password instead forgotten. On success, remove all user sessions, create new session and return it.'
      key :tags, ['Forgot Password']
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
      response '201' do
        key :description, 'Created'
        schema do
          key :'$ref', :OutputSession
        end
      end
      extend Api::Docs::Shared::UnprocessableEntity
    end
  end
  # :nocov:
end
