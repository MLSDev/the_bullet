module Api
  module V1
    module Docs
      module Shared
        module SwaggerUnauthorized
          def self.extended(base)
            base.response '401' do
              key :description, 'Unauthorized'
            end
          end
        end
      end
    end
  end
end
