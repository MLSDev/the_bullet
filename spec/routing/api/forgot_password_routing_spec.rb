# frozen_string_literal: true

require 'rails_helper'

describe Api::ForgotPasswordsController do
  describe 'routing' do
    it 'should route POST /api/forgot_password to api/forgot_passwords#create' do
      expect(post: '/api/forgot_password').to route_to(
        controller: 'api/forgot_passwords',
        action: 'create',
        format: 'json'
      )
    end
  end
end
