class User::SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
    self.resource = warden.authenticate!(auth_options)

    lat = params[:user][:latitude]
    lng = params[:user][:longitude]

    if !lat || !lng || self.resource.is_in_range?(lat, lng)
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      set_flash_message!(:alert, :out_of_range)
      sign_out(resource)
      respond_with resource, location: after_sign_out_path_for(resource)
    end



  end
end
