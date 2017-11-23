# frozen_string_literal: true

require 'rails_helper'

describe Backoffice::UsersController do
  describe 'routing' do
    it 'should route GET /backoffice/users to backoffice/users#index' do
      expect(get: '/backoffice/users').to route_to(
        controller: 'backoffice/users',
        action: 'index',
        format: 'json'
      )
    end

    it 'should route POST /backoffice/users to backoffice/users#create' do
      expect(post: '/backoffice/users').to route_to(
        controller: 'backoffice/users',
        action: 'create',
        format: 'json'
      )
    end

    it 'should route GET /backoffice/users/42 to backoffice/users#show' do
      expect(get: '/backoffice/users/42').to route_to(
        controller: 'backoffice/users',
        action: 'show',
        id: '42',
        format: 'json'
      )
    end

    it 'should route PUT /backoffice/users/42 to backoffice/users#update' do
      expect(put: '/backoffice/users/42').to route_to(
        controller: 'backoffice/users',
        action: 'update',
        id: '42',
        format: 'json'
      )
    end

    it 'should route PATCH /backoffice/users/42 to backoffice/users#update' do
      expect(patch: '/backoffice/users/42').to route_to(
        controller: 'backoffice/users',
        action: 'update',
        id: '42',
        format: 'json'
      )
    end

    it 'should route DELETE /backoffice/users/42 to backoffice/users#destroy' do
      expect(delete: '/backoffice/users/42').to route_to(
        controller: 'backoffice/users',
        action: 'destroy',
        id: '42',
        format: 'json'
      )
    end
  end
end
