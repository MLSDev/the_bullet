# frozen_string_literal: true

require 'rails_helper'

describe Api::SetNewPasswordsController do
  describe 'routing' do
    it 'should route POST /api/set_new_password to api/set_new_passwords#create' do
      expect(post: '/api/set_new_password').to route_to(
        controller: 'api/set_new_passwords',
        action: 'create',
        format: 'json'
      )
    end
  end
end
