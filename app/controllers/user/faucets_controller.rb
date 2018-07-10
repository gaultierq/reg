class User::FaucetsController < User::BaseController
  before_action :set_faucet, only: :show

  # GET /user/faucets
  def index
    if params[:rfid_number].present?
      @faucet = Faucet.find_by(rfid_number: params[:rfid_number])
      if @faucet.present?
        redirect_to user_faucet_path(@faucet)
      else
        @faucets = current_user.faucets.all
      end
    elsif params[:serial_number].present?
      @faucet = Faucet.find_by(serial_number: params[:serial_number])
      if @faucet.present?
        redirect_to user_faucet_path(@faucet)
      else
        @faucets = current_user.faucets.all
      end
    else
      @faucets = current_user.faucets.all
    end
  end

  # GET /user/faucets/1
  def show
    @browser = Browser.new(request.env['HTTP_USER_AGENT'])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faucet
      @faucet = Faucet.find(params[:id])
    end
end
