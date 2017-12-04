# frozen_string_literal: true

class Api::ProfilesController < BaseController
  private

  def resource
    current_user
  end
end
