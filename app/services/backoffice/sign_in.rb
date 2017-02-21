module Backoffice
  class SignIn
    include ActiveModel::Validations

    attr_reader :email, :password, :session

    validate :superuser_presence

    validate :superuser_password

    delegate :decorate, to: :session, prefix: nil

    def initialize(params = {})
      @email = params[:email]
      @password = params[:password]
    end

    def save!
      raise ActiveModel::StrictValidationFailed unless valid?

      create_session!
    end

    private

    def superuser
      @superuser ||= Superuser.where('LOWER(email) = LOWER(?)', email).first
    end

    def superuser_presence
      errors.add(:base, 'Email and/or password is invalid') unless superuser
    end

    def superuser_password
      return unless superuser

      errors.add(:base, 'Email and/or password is invalid') unless superuser.authenticate(password)
    end

    def create_session!
      @session ||= superuser.sessions.create!
    end
  end
end
