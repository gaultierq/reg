class Admin::UsersController < Admin::ApplicationController

  # GET /admin/users
  # GET /admin/users.json
  def index
    @admins = Admin.all
    @technicians = Technician.all
  end
end
