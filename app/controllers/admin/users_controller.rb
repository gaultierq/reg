class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :unlock]

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.invite!(user_params)
    add_industrial_unit
    redirect_to admin_peoples_path, notice: 'Invitation envoyée.'
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      add_industrial_unit
      redirect_to admin_user_path(@user), notice: 'Client(e) modifié(e) avec succès.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to admin_peoples_url, notice: 'Client(e) supprimé(e) avec succès.'
  end

  def add_industrial_unit
    industrial_unit = []
    if params[:user].present?
      if params[:user][:industrial_units].present?
        industrial_unit << IndustrialUnit.where(id: params[:user][:industrial_units].drop(1))
      end
    end
    @user.industrial_units.delete_all
    @user.industrial_units << industrial_unit
  end

  def unlock
    if @user.unlock_access!
      redirect_to admin_peoples_url, notice: 'Utilisateur débloqué.'
    else
      redirect_to admin_peoples_path, alert: "Utilisateur n'a pas pu être débloqué."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :last_name, :first_name, :phone_number)
    end
end
