# frozen_string_literal: true

class SessionDecorator < Draper::Decorator
  delegate_all
  decorates_association :user

  def as_json(*)
    {
      user:  user,
      token: token
    }
  end
end
