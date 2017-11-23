# frozen_string_literal: true

require 'rails_helper'

describe Api::PasswordResetsController do
  describe 'routing' do
    it 'should route POST /api/password_reset to api/password_resets#create' do
      expect(post: '/api/password_reset').to route_to(
        controller: 'api/password_resets',
        action: 'create',
        format: 'json'
      )
    end
  end
end
