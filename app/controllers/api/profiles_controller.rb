# frozen_string_literal: true

class Api::ProfilesController < Api::BaseController
  skip_before_action :authenticate!, except: :show

  private
  def build_resource
    @profile = Api::SignUp.new(resource_params)
  end

  def resource
    @profile ||= current_user
  end

  def resource_params
    params.permit(:email, :password, :password_confirmation)
  end
end



