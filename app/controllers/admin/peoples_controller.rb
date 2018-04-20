class Admin::PeoplesController < Admin::BaseController

  # GET /admin/peoples
  def index
    @admins = Admin.all
    @users = User.all
  end
end
