# frozen_string_literal: true

class Backoffice::BaseController < ApplicationController

  private

  def authenticate!
    authenticate_or_request_with_http_token do |token,|
      @current_user = Backoffice::Superuser.joins(:sessions)
                               .where(backoffice_sessions: { token: token })
                               .first
    end
  end
end
