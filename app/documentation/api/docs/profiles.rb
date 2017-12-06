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
        key :name, :email
        key :in, :formData
        key :required, true
        key :type, :string
        key :description, 'User email'
      end
      parameter do
        key :name, :password
        key :in, :formData
        key :required, true
        key :type, :string
        key :format, :password
        key :description, 'User password'
      end
      parameter do
        key :name, :password_confirmation
        key :in, :formData
        key :required, true
        key :type, :string
        key :format, :password
        key :description, 'User password confirmation'
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
