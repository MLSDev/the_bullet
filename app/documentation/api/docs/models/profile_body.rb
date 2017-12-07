# frozen_string_literal: true

module Api
  module Docs
    module Models
      class ProfileBody
        # :nocov:
        include Swagger::Blocks

        swagger_schema :ProfileBody do
          key :required, [:email, :password, :password_confirmation]
          property :email do
            key :type, :string
            key :description, 'User email'
          end
          property :password do
            key :type, :string
            key :description, 'User password'
          end
          property :password_confirmation do
            key :type, :string
            key :description, 'User password confirmation'
          end
          key :example, email: 'me@example.com',
                        password: 'q1234567',
                        password_confirmation: 'q1234567'
        end
        # :nocov:
      end
    end
  end
end
