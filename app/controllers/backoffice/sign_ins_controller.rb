module Backoffice
  class SignInsController < BaseController
    skip_before_action :authenticate!

    private

    def build_resource
      @sign_in = Backoffice::SignIn.new(resource_params)
    end

    def resource
      @sign_in
    end

    def resource_params
      params.permit(:email, :password)
    end
  end
end
