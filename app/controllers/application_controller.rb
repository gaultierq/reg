class ApplicationController < ActionController::Base


  def root
    if current_user
      redirect_to '/user'
    elsif current_admin
      redirect_to admin_industrial_units_path
    else
      redirect_to '/users/sign_in'
    end
  end


end
