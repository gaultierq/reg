# frozen_string_literal: true

# The base controller for all ActiveStorage controllers.
class ActiveStorage::BaseController < ActionController::Base
  protect_from_forgery with: :exception
  before_action  :authenticate!

  before_action do
    ActiveStorage::Current.host = request.base_url
  end

  # TODO: check if the document belongs to the user / industrial unit
  def authenticate!
    unless user_signed_in? || admin_signed_in?
      render :file => "#{Rails.root}/public/404.html",  layout: false, status: :not_found
    end
  end

end
