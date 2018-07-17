class RegistrationController < ApplicationController
  def new
    @admins = Admin.all
  end

  def create
    @registration = Registration.new(registration_params)
    if @registration.admin.blank?
      email = "gregoire.dubelloy@gmail.com"
    else
      email = @registration.admin.email
    end

    puts(email).inspect
    puts(@registration.admin).inspect
    RegistrationMailer.registration_email(@registration, email).deliver_later

    redirect_to new_user_session_path, notice: "Demande envoyée."
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def registration_params
    params.permit(:last_name, :first_name, :email, :phone_number, :admin_id)
  end
end