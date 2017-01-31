module Api
  module Docs
    module Models
      class UnprocessableEntity
        # :nocov:
        include Swagger::Blocks

        swagger_schema :UnprocessableEntity do
          property :errors do
            key :type, :array
            items do
              key :type, :string
            end
          end
        end
        # :nocov:
      end
    end
  end
end
