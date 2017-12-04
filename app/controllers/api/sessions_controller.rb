# frozen_string_literal: true

class Api::SessionsController < BaseController
  before_action :authenticate!, only: :destroy

  def destroy
    Api::SignOut.new(request).destroy!

    head :ok
  end

  private

  def build_resource
    @session = Api::SignIn.new(resource_params)
  end

  def resource
    @session
  end

  def resource_params
    params.permit(:email, :password)
  end
end
