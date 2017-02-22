class SessionDecorator < Draper::Decorator
  delegate_all

  def as_json(*)
    {
      id: id,
      token: token,
      created_at: created_at.iso8601,
      updated_at: updated_at.iso8601
    }
  end
end
