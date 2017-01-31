module Api
  class RequestPasswordResetsController < BaseController
    skip_before_action :authenticate

    def create
      build_resource

      resource.save!

      head :ok
    end

    private

    def build_resource
      @request_password_reset = Api::RequestPasswordReset.new(resource_params)
    end

    def resource
      @request_password_reset
    end

    def resource_params
      params.permit(:email)
    end
  end
end
