module Api
  module Docs
    module Shared
      module UnprocessableEntity
        def self.extended(base)
          base.response '422' do
            key :description, 'Unprocessable Entity'
            schema do
              key :'$ref', :UnprocessableEntity
            end
          end
        end
      end
    end
  end
end
