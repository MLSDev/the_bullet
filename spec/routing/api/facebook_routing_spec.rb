require 'rails_helper'

describe Api::FacebookController do
  describe 'routing' do
    it 'should route POST /api/facebook to api/facebook#create' do
      expect(post: '/api/facebook').to route_to(
        controller: 'api/facebook',
        action: 'create',
        format: 'json'
      )
    end
  end
end
