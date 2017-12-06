# frozen_string_literal: true

module Api
  module Docs
    module Models
      class OutputSession
        # :nocov:
        include Swagger::Blocks

        swagger_schema :OutputSession do
          key :required, [:id, :token, :created_at, :updated_at]
          property :user do
            key :'$ref', :OutputUser
            key :description, 'Session ID'
          end
          property :token do
            key :type, :string
            key :description, 'Session token'
          end
          key :example, user: {},
                        token: 'AAkoMiLatQHMngyuUU1vnh5b'
        end
        # :nocov:
      end
    end
  end
end
