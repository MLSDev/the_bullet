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
      key :basePath, '/api/v1'
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
      Api::V1::Docs::Models::OutputUser,
      Api::V1::Docs::Models::OutputSession,
      Api::V1::Docs::Models::UnprocessableEntity,

      Api::V1::Docs::SignUps,
      Api::V1::Docs::SignIns,
      Api::V1::Docs::SignOuts,
      Api::V1::Docs::Profiles,
      Api::V1::Docs::RequestPasswordResets,
      Api::V1::Docs::PasswordResets,

      self
    ].freeze
    # :nocov:

    def index
      render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
    end
  end
end
