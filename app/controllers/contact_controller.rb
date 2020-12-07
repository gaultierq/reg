class ContactController < ApplicationController

  def index
    @user = current_user if user_signed_in?
    @user = current_admin if admin_signed_in?
  end

  def congrats

  end

  def send_email
    ContactMailer.send_query(params).deliver_now
    redirect_to contact_sent_url, notice: "Merci pour votre message"
  end


end
