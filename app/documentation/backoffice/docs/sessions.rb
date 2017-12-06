# frozen_string_literal: true

class Backoffice::Docs::Sessions
  # :nocov:
  include Swagger::Blocks

  swagger_path '/sessions' do
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
      response '201' do
        key :description, 'Created'
        schema do
          key :'$ref', :OutputSession
        end
      end
      # extend Api::Docs::Shared::UnprocessableEntity
    end

    operation :delete do
      key :summary, 'Sign out superuser'
      key :description, 'Sign out superuser'
      key :tags, ['sign out']
      parameter :authorization
      response '204' do
        key :description, 'No Content'
      end
      extend Backoffice::Docs::Shared::Unauthorized
    end
  end
  # :nocov:
end
