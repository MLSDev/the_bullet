# frozen_string_literal: true

module Api
  module Docs
    module Models
      class SetNewPasswordBody
        # :nocov:
        include Swagger::Blocks

        swagger_schema :SetNewPasswordBody do
          key :required, [:reset_token, :password, :password_confirmation]
          property :reset_token do
            key :type, :string
            key :description, 'Reset token from email'
          end
          property :password do
            key :type, :string
            key :description, 'New password'
          end
          property :password_confirmation do
            key :type, :string
            key :description, 'Password Confirmation'
          end
          key :example, reset_token: "5c1GahRNkBxQeLGopvtuY3q2",
                        password: "q1234567",
                        password_confirmation: "q1234567"
        end
        # :nocov:
      end
    end
  end
end
