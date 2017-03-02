module Backoffice
  module Docs
    module Models
      class OutputUsersCollection
        # :nocov:
        include Swagger::Blocks

        swagger_schema :OutputUsersCollection do
          key :required, [:collection, :total_pages, :current_page, :total_count, :per_page]
          property :collection do
            key :type, :array
            items do
              key :'$ref', :OutputUser
            end
          end
          property :total_pages do
            key :type, :integer
            key :format, :int64
            key :description, 'Total pages count'
          end
          property :current_page do
            key :type, :integer
            key :format, :int64
            key :description, 'Current page number'
          end
          property :total_count do
            key :type, :integer
            key :format, :int64
            key :description, 'Total users count'
          end
          property :per_page do
            key :type, :integer
            key :format, :int64
            key :description, 'Per page value'
          end
          key :example, total_page: 4,
                        current_page: 1,
                        total_count: 100,
                        per_page: 25

          # key :example, collection: {},
          #               total_page: 4,
          #               current_page: 1,
          #               total_count: 100,
          #               per_page: 25
        end
        # :nocov:
      end
    end
  end
end
