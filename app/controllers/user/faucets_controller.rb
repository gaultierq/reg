class User::FaucetsController < User::BaseController
  before_action :set_faucet, only: :show

  # GET /user/faucets
  def index
    @faucets = current_user.faucets.all
  end

  # GET /user/faucets/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faucet
      @faucet = Faucet.find(params[:id])
    end
end
