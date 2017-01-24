module Api
  module V1
    class SignOutsController < BaseController
      def destroy
        Api::SignOut.new(request).destroy!

        head :ok
      end
    end
  end
end
