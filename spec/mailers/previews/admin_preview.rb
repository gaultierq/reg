# Preview all emails at http://localhost:3000/rails/mailers/admin
class AdminPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/admin/otp_email
  def otp_email
    AdminMailer.otp_email
  end

end
