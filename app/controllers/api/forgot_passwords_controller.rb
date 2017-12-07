# frozen_string_literal: true

class Api::ForgotPasswordsController < Api::BaseController
  skip_before_action :authenticate!

  def create
    build_resource

    resource.save!

    head :no_content
  end

  private

  def build_resource
    @forgot_password = Api::ForgotPassword.new(resource_params)
  end

  def resource
    @forgot_password
  end

  def resource_params
    params.require(:forgot_password).permit(:email)
  end
end
