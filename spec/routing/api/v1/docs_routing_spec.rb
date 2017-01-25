require 'rails_helper'

describe Api::V1::DocsController do
  describe 'routing' do
    it 'should route GET /api/v1/docs to api/v1/docs#index' do
      expect(get: '/api/v1/docs').to route_to(
        controller: 'api/v1/docs',
        action: 'index',
        format: 'json'
      )
    end
  end
end
