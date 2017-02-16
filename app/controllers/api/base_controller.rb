module Api
  class BaseController < ApplicationController
    protect_from_forgery with: :exception, unless: -> { request.format.json? }

    before_action :authenticate!

    attr_reader :current_user

    helper_method :collection, :resource, :parent, :current_user

    def show
      resource
    end

    def create
      build_resource

      resource.save!
    end

    def update
      resource.update!(resource_params)
    end

    def destroy
      resource.destroy!

      head :ok
    end

    # :nocov:
    rescue_from ActionController::ParameterMissing do |exception|
      @exception = exception

      render :exception, status: :unprocessable_entity
    end

    rescue_from ActiveRecord::RecordInvalid, ActiveModel::StrictValidationFailed do
      render :errors, status: :unprocessable_entity
    end

    rescue_from ActiveRecord::RecordNotFound do
      head :not_found
    end
    # :nocov:

    private

    def authenticate
      authenticate_with_http_token do |token,|
        @current_user = User.joins(:sessions)
                            .where(sessions: { token: token })
                            .first
      end
    end

    def authenticate!
      authenticate_or_request_with_http_token do |token,|
        @current_user = User.joins(:sessions)
                            .where(sessions: { token: token })
                            .first
      end
    end

    def parent
      raise NotImplementedError
    end

    def resource
      raise NotImplementedError
    end

    def resource_params
      raise NotImplementedError
    end

    def build_resource
      raise NotImplementedError
    end

    def collection
      raise NotImplementedError
    end
  end
end
