module Backoffice
  module Docs
    class Users
      # :nocov:
      include Swagger::Blocks

      swagger_path '/users' do
        operation :get do
          key :summary, 'Get users list'
          key :description, 'Get users list'
          key :tags, ['users']
          parameter :authorization
          parameter :page
          response '200' do
            key :description, 'Success'
          end
        end

        operation :post do
          key :summary, 'Create new user'
          key :description, 'Create new user'
          key :tags, ['users']
          parameter :authorization
          response '200' do
            key :description, 'Response with user'
            schema do
              key :'$ref', :OutputUser
            end
          end
        end
      end

      swagger_path '/users/{id}' do
        operation :get do
          key :summary, 'Show user'
          key :description, 'Show user'
          key :tags, ['users']
          parameter :authorization
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'User ID'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          response '200' do
            key :description, 'Response with user'
            schema do
              key :'$ref', :OutputUser
            end
          end
          response '404' do
            key :description, 'User not found'
          end
        end

        operation :put do
          key :summary, 'Update user'
          key :description, 'Update user'
          key :tags, ['users']
          parameter :authorization
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'User ID'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          response '200' do
            key :description, 'Response with updated user'
            schema do
              key :'$ref', :OutputUser
            end
          end
          response '404' do
            key :description, 'User not found'
          end
        end

        operation :patch do
          key :summary, 'Update user'
          key :description, 'Update user'
          key :tags, ['users']
          parameter :authorization
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'User ID'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          response '200' do
            key :description, 'Response with updated user'
            schema do
              key :'$ref', :OutputUser
            end
          end
          response '404' do
            key :description, 'User not found'
          end
        end

        operation :delete do
          key :summary, 'Delete user'
          key :description, 'Delete user'
          key :tags, ['users']
          parameter :authorization
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'User ID'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          response '200' do
            key :description, 'Success'
          end
          response '404' do
            key :description, 'User not found'
          end
        end
      end
      # :nocov:
    end
  end
end
