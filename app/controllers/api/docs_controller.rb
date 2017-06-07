module Api
  class DocsController < ActionController::Base
    include Swagger::Blocks

    # :nocov:
    swagger_root do
      key :swagger, '2.0'
      info do
        key :version, '1.0.0'
        key :title, 'Example REST API'
        key :description, 'Example REST API'
      end
      tag do
        key :name, 'sign up'
        key :description, 'Sign Up operations'
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
        key :name, 'profile'
        key :description, 'Profile operations'
      end
      tag do
        key :name, 'request password reset'
        key :description, 'Request password reset'
      end
      tag do
        key :name, 'password reset'
        key :description, 'Password reset'
      end
      key :host, 'localhost:3000'
      key :basePath, '/api'
      key :consumes, ['application/json']
      key :produces, ['application/json']
      parameter :authorization do
        key :name, 'Authorization'
        key :in, :header
        key :description, 'User auth token. Example: Bearer AAkoMiLatQHMngyuUU1vnh5b'
        key :default, 'Bearer ACCESS_TOKEN'
        key :required, true
        key :type, :string
      end
    end

    # A list of all classes that have swagger_* declarations.
    SWAGGERED_CLASSES = [
      Api::Docs::Models::OutputUser,
      Api::Docs::Models::OutputSession,
      Api::Docs::Models::UnprocessableEntity,

      Api::Docs::SignUps,
      Api::Docs::Sessions,
      Api::Docs::Profiles,
      Api::Docs::RequestPasswordResets,
      Api::Docs::PasswordResets,

      self
    ].freeze
    # :nocov:

    def index
      render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
    end
  end
end
