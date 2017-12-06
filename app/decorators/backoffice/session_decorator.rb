# frozen_string_literal: true

class Backoffice::SessionDecorator < Draper::Decorator
  delegate_all
  decorates_association :user

  def as_json(*)
    {
      user:  superuser,
      token: token
    }
  end
end
