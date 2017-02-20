require 'rails_helper'

describe Backoffice::SignInsController do
  describe 'routing' do
    it 'should route POST /backoffice/sign_in to backoffice/sign_ins#create' do
      expect(post: '/backoffice/sign_in').to route_to(
        controller: 'backoffice/sign_ins',
        action: 'create',
        format: 'json'
      )
    end
  end
end
