module Api
  class PasswordReset
    include ActiveModel::Validations

    attr_reader :user, :session, :reset_token, :password, :password_confirmation

    attr_writer :password

    validate :user_presence

    validates :password, confirmation: true

    validates :password_confirmation, presence: true

    delegate :decorate, to: :session, prefix: nil

    def initialize(params = {})
      @reset_token = params[:reset_token]
      @password = params[:password]
      @password_confirmation = params[:password_confirmation]
    end

    def save!
      raise ActiveModel::StrictValidationFailed unless valid?

      user.sessions.destroy_all

      create_session!
    end

    private

    def user
      @user ||= User.find_by(reset_token: reset_token)
    end

    def user_presence
      errors.add(:user, 'not found') unless user
    end

    def create_session!
      @session ||= user.sessions.create!
    end
  end
end
