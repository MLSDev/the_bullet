# frozen_string_literal: true

module Api
  module Docs
    module Models
      class SessionBody
        # :nocov:
        include Swagger::Blocks

        swagger_schema :SessionBody do
          key :required, [:email, :password]
          property :email do
            key :type, :string
            key :description, 'User email'
          end
          property :password do
            key :type, :string
            key :description, 'User password'
          end
          key :example, email: 'me@example.com',
                        password: 'q1234567'
        end
        # :nocov:
      end
    end
  end
end
