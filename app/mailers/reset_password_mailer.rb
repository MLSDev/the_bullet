# frozen_string_literal: true

class ResetPasswordMailer < ApplicationMailer
  def email(id)
    @user = User.find(id)

    mail(to: @user.email, subject: 'Reset password mail')
  end
end
