class AdminMailer < ApplicationMailer

  def otp_email(admin, code)
    @code = code
    mail(to: admin.email, subject: "Your one time password")
  end
end
