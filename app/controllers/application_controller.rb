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


  private
  def after_sign_out_path_for(resource_or_scope)
    if :admin == resource_or_scope
      '/admins/sign_in'
    else
      root_path
    end
  end

end
