# frozen_string_literal: true

class Api::SetNewPasswordsController < Api::BaseController
  skip_before_action :authenticate!

  def create
    build_resource

    resource.save!

    head :no_content
  end

  private

  def build_resource
    @set_new_password = Api::SetNewPassword.new(resource_params)
  end

  def resource
    @set_new_password
  end

  def resource_params
    params.require(:set_new_password).permit(:reset_token, :password, :password_confirmation)
  end
end
