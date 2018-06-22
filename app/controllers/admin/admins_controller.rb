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
    @admin = Admin.invite!(admin_params)
    add_industrial_unit
    redirect_to admin_peoples_path, notice: 'Invitation envoyée.'
  end

  # PATCH/PUT /admins/1
  def update
    if params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
      params[:admin].delete(:password)
      params[:admin].delete(:password_confirmation)
    end
    if @admin.update(admin_params)
      add_industrial_unit
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

  def add_industrial_unit
    industrial_unit = []
    if params[:admin].present?
      if params[:admin][:industrial_units].present?
        industrial_unit << IndustrialUnit.where(id: params[:admin][:industrial_units].drop(1))
      end
    end
    @admin.industrial_units.delete_all
    @admin.industrial_units << industrial_unit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:email, :password, :password_confirmation, :first_name, :last_name, :phone_number)
    end
end
