class Admin::PeoplesController < Admin::MainController

  # GET /admin/peoples
  def index
    @admins = Admin.all
    @users = User.all
  end
end
