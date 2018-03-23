class Admin::UsersController < Admin::ApplicationController

  # GET /admin/users
  def index
    @admins = Admin.all
    @technicians = Technician.all
  end
end
