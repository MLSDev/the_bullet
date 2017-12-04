# frozen_string_literal: true

class Backoffice::SessionsController < BaseController
  before_action :authenticate!, only: :destroy

  def destroy
    Backoffice::SignOut.new(request).destroy!

    head :ok
  end

  private

  def build_resource
    @session = Backoffice::SignIn.new(resource_params)
  end

  def resource
    @session
  end

  def resource_params
    params.permit(:email, :password)
  end
end
