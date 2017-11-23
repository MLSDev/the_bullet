# frozen_string_literal: true

require 'rails_helper'

describe Backoffice::DocsController do
  describe 'routing' do
    it 'should route GET /backoffice/docs to backoffice/docs#index' do
      expect(get: '/backoffice/docs').to route_to(
        controller: 'backoffice/docs',
        action: 'index',
        format: 'json'
      )
    end
  end
end
