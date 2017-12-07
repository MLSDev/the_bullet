# frozen_string_literal: true

class Api::Docs::Sessions
  # :nocov:
  include Swagger::Blocks

  swagger_path '/sessions' do
    operation :post do
      key :summary, 'Sign in'
      key :description, 'Sign in user'
      key :tags, ['Sessions']
      parameter do
        key :name, :session
        key :in, :body
        key :required, true
        key :description, 'Session object'
        schema do
          key :'$ref', :SessionBody
        end
      end
      response '201' do
        key :description, 'Created'
        schema do
          key :'$ref', :OutputSession
        end
      end
      extend Api::Docs::Shared::UnprocessableEntity
    end
  end

  swagger_path '/profile' do
    operation :delete do
      key :summary, 'Sign out'
      key :description, 'Sign out user'
      key :tags, ['Sessions']
      parameter :authorization
      response '204' do
        key :description, 'No Content'
      end
      extend Api::Docs::Shared::Unauthorized
    end
  end
  # :nocov:
end
