class Admin::PeoplesController < Admin::ApplicationController

  # GET /admin/peoples
  def index
    @admins = Admin.all
    @users = User.all
  end
end
