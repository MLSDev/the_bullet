module Api
  module V1
    module Docs
      module Models
        class OutputSession
          # :nocov:
          include Swagger::Blocks

          swagger_schema :OutputSession do
            key :required, [:id, :token, :created_at, :updated_at]
            property :id do
              key :type, :integer
              key :format, :int64
              key :description, 'Session ID'
            end
            property :token do
              key :type, :string
              key :description, 'Session email'
            end
            property :created_at do
              key :type, :string
              key :description, 'Created at in ISO8601 format'
            end
            property :updated_at do
              key :type, :string
              key :description, 'Updated at in ISO8601 format'
            end
          end
          # :nocov:
        end
      end
    end
  end
end
