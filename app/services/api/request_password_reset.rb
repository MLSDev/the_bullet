module Api
  class RequestPasswordReset
    include ActiveModel::Validations

    attr_reader :email

    validate :user_presence

    def initialize(params = {})
      @email = params[:email]
    end

    def save!
      raise ActiveModel::StrictValidationFailed unless valid?

      user.regenerate_reset_token
    end

    private

    def user
      @user ||= User.where('LOWER(email) = LOWER(?)', email).first
    end

    def user_presence
      errors.add(:user, 'not found') unless user
    end
  end
end
