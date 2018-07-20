class User::BaseController < ApplicationController
  layout 'user'

  before_action :authenticate_user!
  before_action :verify_user_in_range

  private

  def verify_user_in_range
    location = Geokit::Geocoders::IpGeocoder.geocode(current_user.current_sign_in_ip)
    return if current_user.industrial_units.in_range(0..10, origin: location).exists?
    sign_out current_user
    flash[:alert] = "Vous n'êtes pas/plus dans votre périmètre d'intervention"
    redirect_to new_user_session_path
  end
end
