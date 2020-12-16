class User::UsersController < User::BaseController
  before_action :set_user, only: [:edit, :update]

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to user_faucets_path, notice: 'Informations modifiées avec succès.'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :last_name, :first_name, :phone_number)
    end
end
