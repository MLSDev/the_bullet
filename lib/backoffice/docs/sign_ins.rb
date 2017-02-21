module Backoffice
  module Docs
    class SignIns
      # :nocov:
      include Swagger::Blocks

      swagger_path '/sign_in' do
        operation :post do
          key :summary, 'Sign in superuser'
          key :description, 'Sign in superuser'
          key :tags, ['sign in']
          parameter do
            key :name, :email
            key :in, :formData
            key :required, true
            key :type, :string
            key :description, 'Superuser email'
          end
          parameter do
            key :name, :password
            key :in, :formData
            key :required, true
            key :type, :string
            key :format, :password
            key :description, 'Superuser password'
          end
          response '200' do
            key :description, 'Success'
            # schema do
            #   key :'$ref', :OutputSession
            # end
          end
          # extend Api::Docs::Shared::UnprocessableEntity
        end
      end
      # :nocov:
    end
  end
end
