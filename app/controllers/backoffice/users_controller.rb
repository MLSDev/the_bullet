# frozen_string_literal: true

class Backoffice::UsersController < Backoffice::BaseController
  private

  def build_resource
    @user = Backoffice::User.new(resource_params)
  end

  def resource
    @user ||= Backoffice::User.find(params[:id])
  end

  def resource_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def collection
    @users ||= Backoffice::User.order(id: :asc).page(params[:page])
  end
end
