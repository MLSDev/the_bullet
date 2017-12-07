# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  before_action :authenticate!

  attr_reader :current_user

  helper_method :collection, :resource, :parent, :current_user

  def create
    build_resource

    resource.save!

    render status: 201
  end

  def update
    resource.update!(resource_params)
  end

  def destroy
    resource.destroy!

    head :no_content
  end

  # :nocov:
  rescue_from ActionController::ParameterMissing do |exception|
    @exception = exception

    render :exception, status: :unprocessable_entity
  end

  rescue_from ActiveRecord::RecordInvalid, ActiveModel::StrictValidationFailed do
    render :errors, status: :unprocessable_entity
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    @exception = exception

    render :exception, status: :not_found
  end
  # :nocov:

  private

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
