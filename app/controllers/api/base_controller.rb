# frozen_string_literal: true

class Api::BaseController < ApplicationController

  private

  def authenticate
    authenticate_with_http_token do |token,|
      @current_user = User.joins(:sessions)
                          .where(sessions: { token: token })
                          .first
    end
  end

  def authenticate!
    authenticate_or_request_with_http_token do |token,|
      @current_user = User.joins(:sessions)
                          .where(sessions: { token: token })
                          .first
    end
  end
end
