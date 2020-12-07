class ContactController < ApplicationController

  def index
    @user = current_user if user_signed_in?
    @user = current_admin if admin_signed_in?
  end

  def congrats

  end

  def send_email
    mail = ENV["FORM_CONTACT_EMAIL"]

    ContactMailer.send_query(mail, params, false).deliver_now
    ContactMailer.send_query(params[:email], params, true).deliver_now
    redirect_to contact_sent_url, notice: "Merci pour votre message"
  end


end
