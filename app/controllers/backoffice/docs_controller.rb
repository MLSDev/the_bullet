module Backoffice
  class DocsController < ActionController::Base
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
    end

    # A list of all classes that have swagger_* declarations.
    SWAGGERED_CLASSES = [
      Backoffice::Docs::Models::OutputSession,

      Backoffice::Docs::SignIns,

      self
    ].freeze
    # :nocov:

    def index
      render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
    end
  end
end
