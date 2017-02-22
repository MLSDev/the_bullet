module Api
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
            key :description, 'Session token'
          end
          property :created_at do
            key :type, :string
            key :format, :'date-time'
            key :description, 'Created at in ISO8601 format'
          end
          property :updated_at do
            key :type, :string
            key :format, :'date-time'
            key :description, 'Updated at in ISO8601 format'
          end
          key :example, id: 123,
                        token: 'AAkoMiLatQHMngyuUU1vnh5b',
                        created_at: Time.zone.now.iso8601,
                        updated_at: Time.zone.now.iso8601
        end
        # :nocov:
      end
    end
  end
end
