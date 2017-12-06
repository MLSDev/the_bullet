# frozen_string_literal: true

class Api::ForgotPasswordsController < Api::BaseController
  skip_before_action :authenticate!

  private

  def build_resource
    @forgot_password = Api::ForgotPassword.new(resource_params)
  end

  def resource
    @forgot_password
  end

  def resource_params
    params.permit(:email)
  end
end
