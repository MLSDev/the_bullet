# frozen_string_literal: true

module Backoffice
  class DocsController < ActionController::Base
    protect_from_forgery with: :exception

    include Swagger::Blocks

    # :nocov:
    swagger_root do
      key :swagger, '2.0'
      info do
        key :version, '1.0.0'
        key :title, 'Example Backoffice REST API'
        key :description, 'Example Backoffice REST API'
      end
      tag do
        key :name, 'sign in'
        key :description, 'Sign In operations'
      end
      tag do
        key :name, 'sign out'
        key :description, 'Sign Out operations'
      end
      tag do
        key :name, 'users'
        key :description, 'Users operations'
      end
      key :host, 'localhost:3000'
      key :basePath, '/backoffice'
      key :consumes, ['application/json']
      key :produces, ['application/json']
      parameter :authorization do
        key :name, 'Authorization'
        key :in, :header
        key :description, 'Superuser auth token. Example: Bearer AAkoMiLatQHMngyuUU1vnh5b'
        key :default, 'Bearer ACCESS_TOKEN'
        key :required, true
        key :type, :string
      end
      parameter :page do
        key :name, :page
        key :in, :query
        key :description, 'Page number. Default: 1'
        key :required, false
        key :type, :integer
        key :format, :int64
      end
    end

    # A list of all classes that have swagger_* declarations.
    SWAGGERED_CLASSES = [
      Backoffice::Docs::Models::OutputSession,
      Backoffice::Docs::Models::OutputUser,
      Backoffice::Docs::Models::OutputUsersCollection,
      Backoffice::Docs::Models::UnprocessableEntity,

      Backoffice::Docs::Sessions,
      Backoffice::Docs::Users,

      self
    ].freeze
    # :nocov:

    def index
      render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
    end
  end
end
