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
          response '200' do
            key :description, 'Response with user'
            schema do
              key :'$ref', :OutputUser
            end
          end
        end

        operation :put do
          key :summary, 'Update user'
          key :description, 'Update user'
          key :tags, ['users']
          parameter :authorization
          response '200' do
            key :description, 'Response with updated user'
            schema do
              key :'$ref', :OutputUser
            end
          end
        end

        operation :patch do
          key :summary, 'Update user'
          key :description, 'Update user'
          key :tags, ['users']
          parameter :authorization
          response '200' do
            key :description, 'Response with updated user'
            schema do
              key :'$ref', :OutputUser
            end
          end
        end

        operation :delete do
          key :summary, 'Delete user'
          key :description, 'Delete user'
          key :tags, ['users']
          parameter :authorization
          response '200' do
            key :description, 'Success'
          end
        end
      end
      # :nocov:
    end
  end
end
