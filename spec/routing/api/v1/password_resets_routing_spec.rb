require 'rails_helper'

describe Api::V1::PasswordResetsController do
  describe 'routing' do
    it 'should route POST /api/v1/password_reset to api/v1/password_resets#create' do
      expect(post: '/api/v1/password_reset').to route_to(
        controller: 'api/v1/password_resets',
        action: 'create',
        format: 'json'
      )
    end
  end
end
