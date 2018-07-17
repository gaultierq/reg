class RegistrationMailer < ApplicationMailer
  def registration_email(user, email)
    @user = user

    mail(to: email,
         from: 'noreply@reg.fr',
         subject: 'Demande de création de compte')
  end
end
