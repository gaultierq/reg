class Admin::AdminsController < Admin::BaseController
  layout 'admin'
  before_action :authenticate_admin!
  before_action :set_admin, only: [:show, :edit, :update, :destroy]

  # GET /admins/1
  def show
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  def create
    Admin.invite!(admin_params)
    redirect_to admin_peoples_path, notice: 'Invitation envoyée.'
  end

  # PATCH/PUT /admins/1
  def update
    if @admin.update(admin_params)
      redirect_to admin_admin_path(@admin), notice: 'Admin modifié avec succès.'
    else
      render :edit
    end
  end

  # DELETE /admins/1
  def destroy
    @admin.destroy
    redirect_to admin_peoples_url, notice: 'Admin supprimé avec succès.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:email, :first_name, :last_name, :phone_number)
    end
end
