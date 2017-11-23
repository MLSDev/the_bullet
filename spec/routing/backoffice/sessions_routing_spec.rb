# frozen_string_literal: true

require 'rails_helper'

describe Backoffice::SessionsController do
  describe 'routing' do
    it 'should route POST /backoffice/sessions to backoffice/sessions#create' do
      expect(post: '/backoffice/sessions').to route_to(
        controller: 'backoffice/sessions',
        action: 'create',
        format: 'json'
      )
    end

    it 'should route DELETE /backoffice/sessions to backoffice/sessions#destroy' do
      expect(delete: '/backoffice/sessions').to route_to(
        controller: 'backoffice/sessions',
        action: 'destroy',
        format: 'json'
      )
    end
  end
end
