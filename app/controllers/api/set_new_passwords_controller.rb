# frozen_string_literal: true

class Api::SetNewPasswordsController < Api::BaseController
  skip_before_action :authenticate!

  private

  def build_resource
    @set_new_password = Api::SetNewPassword.new(resource_params)
  end

  def resource
    @set_new_password
  end

  def resource_params
    params.permit(:reset_token, :password, :password_confirmation)
  end
end
