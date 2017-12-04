# frozen_string_literal: true

class Backoffice::UsersController < BaseController
  private

  def build_resource
    @user = User.new(resource_params)
  end

  def resource
    @user ||= User.find(params[:id])
  end

  def resource_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def collection
    @users ||= User.order(id: :asc).page(params[:page])
  end
end
