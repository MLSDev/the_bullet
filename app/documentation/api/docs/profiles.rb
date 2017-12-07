# frozen_string_literal: true

class Api::Docs::Profiles
  # :nocov:
  include Swagger::Blocks

  swagger_path '/profile' do
    operation :post do
      key :summary, 'Sign up'
      key :description, 'Sign up new user.'
      key :tags, ['Profile']
      parameter do
        key :name, :profile
        key :in, :body
        key :required, true
        key :description, 'Profile Object'
        schema do
          key :'$ref', :ProfileBody
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
    operation :get do
      key :summary, 'Profile'
      key :description, 'Get user profile'
      key :tags, ['Profile']
      parameter :authorization
      response '200' do
        key :description, 'Success'
        schema do
          key :'$ref', :OutputUser
        end
      end
      extend Api::Docs::Shared::Unauthorized
    end
  end
  # :nocov:
end
