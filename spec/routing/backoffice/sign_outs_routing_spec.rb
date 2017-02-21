require 'rails_helper'

describe Backoffice::SignOutsController do
  describe 'routing' do
    it 'should route DELETE /backoffice/sign_out to backoffice/sign_outs#destroy' do
      expect(delete: '/backoffice/sign_out').to route_to(
        controller: 'backoffice/sign_outs',
        action: 'destroy',
        format: 'json'
      )
    end
  end
end
