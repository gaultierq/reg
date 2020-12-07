class ContactMailer < ApplicationMailer

  def send_query(params)
    @params = params
    Rails.logger.debug "contact: sending message #{@params}"
    mail(to: ENV["FORM_CONTACT_EMAIL"], subject: "Message d'un utilisateur")
  end
end
