class ContactMailer < ApplicationMailer

  def send_query(to, params, copy)
    @copy = copy
    @params = params
    mail(to: to, subject: "Formulaire de contact")
  end
end
