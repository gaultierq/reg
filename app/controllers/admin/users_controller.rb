class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

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
    User.invite!(user_params)
    redirect_to admin_peoples_path, notice: 'Invitation envoyée.'
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: 'Technicien(ne) modifié(e) avec succès.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to admin_peoples_url, notice: 'Technicien(ne) supprimé(e) avec succès.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :last_name, :first_name)
    end
end
