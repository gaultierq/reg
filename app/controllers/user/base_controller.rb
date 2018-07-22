class User::BaseController < ApplicationController
  layout 'user'

  before_action :authenticate_user!
  before_action :verify_user_in_range

  private

  def verify_user_in_range
    if current_user.industrial_units.any?
      location = Geokit::Geocoders::MultiGeocoder.geocode(current_user.current_sign_in_ip)
      return if location.success? && current_user.industrial_units.in_range(user_login_range, origin: location).exists?
    end

    sign_out current_user
    flash[:alert] = "Vous n'êtes pas/plus dans votre périmètre d'intervention"
    redirect_to new_user_session_path
  end

  def user_login_range
    (0..user_login_max_distance)
  end

  def user_login_max_distance
    current_user.industrial_units.reduce(0) do |memo, industrial_unit|
      industrial_unit.sign_in_perimeter > memo ? industrial_unit.sign_in_perimeter : memo
    end
  end
end
