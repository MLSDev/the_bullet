class ResetPasswordMailer < ApplicationMailer
  def email(user_id)
    @user = User.find(user_id)

    mail(to: @user.email, subject: 'Reset password mail')
  end
end
