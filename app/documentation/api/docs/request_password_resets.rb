# frozen_string_literal: true

module Api
  module Docs
    class RequestPasswordResets
      # :nocov:
      include Swagger::Blocks

      swagger_path '/request_password_reset' do
        operation :post do
          key :summary, 'Request password reset'
          key :description, 'Request password reset. On success, send email to user with instruction.'
          key :tags, ['request password reset']
          parameter do
            key :name, :email
            key :in, :formData
            key :required, true
            key :type, :string
            key :description, 'User email'
          end
          response '200' do
            key :description, 'Success'
          end
          extend Api::Docs::Shared::UnprocessableEntity
        end
      end
      # :nocov:
    end
  end
end
