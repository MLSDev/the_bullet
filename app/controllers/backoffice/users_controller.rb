module Backoffice
  class UsersController < BaseController
    private

    def build_resource
      @user = User.build(resource_params)
    end

    def resource
      @user ||= User.find(params[:id])
    end

    def resource_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def collection
      @users ||= User.page(params[:page])
    end
  end
end
