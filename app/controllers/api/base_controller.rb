module Api
  class BaseController < ApplicationController
    protect_from_forgery with: :exception, unless: -> { request.format.json? }

    helper_method :collection, :resource

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

    private

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
