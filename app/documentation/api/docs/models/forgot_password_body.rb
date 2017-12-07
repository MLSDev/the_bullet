# frozen_string_literal: true

module Api
  module Docs
    module Models
      class ForgotPasswordBody
        # :nocov:
        include Swagger::Blocks

        swagger_schema :ForgotPasswordBody do
          key :required, [:email]
          property :email do
            key :type, :string
            key :description, 'User email'
          end
          key :example, email: "example@gmail.com"
        end
        # :nocov:
      end
    end
  end
end
