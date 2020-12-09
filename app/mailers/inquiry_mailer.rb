class InquiryMailer < ApplicationMailer

  def inquiry_email(to, inquiry, is_copy)

    @copy = is_copy
    @inquiry = inquiry
    mail(to: to, subject: "Formulaire de contact") unless to.nil?
  end
end
