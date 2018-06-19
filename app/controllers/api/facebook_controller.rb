module Api
  class FacebookController < BaseController
    skip_before_action :authenticate!

    private

    def build_resource
      @facebook = Api::Facebook.new(resource_params)
    end

    def resource
      @facebook
    end

    def resource_params
      params.permit(:facebook_access_token)
    end
  end
end
