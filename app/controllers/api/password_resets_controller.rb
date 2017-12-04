# frozen_string_literal: true

class Api::PasswordResetsController < BaseController
  skip_before_action :authenticate!

  private

  def build_resource
    @password_reset = Api::PasswordReset.new(resource_params)
  end

  def resource
    @password_reset
  end

  def resource_params
    params.permit(:reset_token, :password, :password_confirmation)
  end
end
