module Backoffice
  class SignOutsController < BaseController
    def destroy
      Backoffice::SignOut.new(request).destroy!

      head :ok
    end
  end
end
