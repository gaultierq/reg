class UserMailer < ApplicationMailer

  def otp_email(user, code)
    @code = code
    mail(to: user.email, subject: "Votre code REG")
  end
end
