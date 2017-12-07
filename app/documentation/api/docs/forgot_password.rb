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
        key :name, :forgot_password
        key :in, :body
        key :required, true
        key :description, 'Forgot Password'
        schema do
          key :'$ref', :ForgotPasswordBody
        end
      end
      response '204' do
        key :description, 'No Content'
      end
      extend Api::Docs::Shared::UnprocessableEntity
    end
  end

  swagger_path '/set_new_password' do
    operation :post do
      key :summary, 'Set new password'
      key :description, 'Set new password instead forgotten.'
      key :tags, ['Forgot Password']
      parameter do
        key :name, :set_new_password
        key :in, :body
        key :required, true
        key :description, 'Set new password object'
        schema do
          key :'$ref', :SetNewPasswordBody
        end
      end
      response '204' do
        key :description, 'No Content'
        schema do
          key :'$ref', :OutputSession
        end
      end
      extend Api::Docs::Shared::UnprocessableEntity
    end
  end
  # :nocov:
end
