class User::FaucetsController < User::BaseController
  before_action :set_faucet, only: [:show, :edit, :update]

  # GET /user/faucets
  def index
    if params[:rfid_number].present?
      @faucet = current_user.faucets.find_by(rfid_number: params[:rfid_number])
      if @faucet.present?
        redirect_to user_faucet_path(@faucet)
      else
        flash.now[:alert] = 'Impossible de trouver ce robinet'
        # @faucets = current_user.faucets.all
      end
    elsif params[:serial_number].present?
      @faucet = current_user.faucets.find_by(serial_number: params[:serial_number])
      if @faucet.present?
        redirect_to user_faucet_path(@faucet)
      else
        flash.now[:alert] = 'Impossible de trouver ce robinet'
        # @faucets = current_user.faucets.all
      end
    else
      @faucets = current_user.faucets.all
    end
  end



  # GET /user/faucets/1
  def show
    @browser = Browser.new(request.env['HTTP_USER_AGENT'])
  end

  # GET /faucets/1/edit
  def edit
  end

  # PATCH/PUT /faucets/1
  def update
    if @faucet.update(faucet_params)
      redirect_to user_faucet_path(@faucet), notice: 'Robinet modifié avec succès.'
    else
      render :edit
    end
  end


  def archive_user
    @faucet = Faucet.find(params[:id])
    if @faucet.archived.nil? || !@faucet.archived
      @faucet.archived = true
      if @faucet.save
        redirect_to user_faucet_path(@faucet), notice: 'Robinet désactivé avec succès.'
      else
        redirect_to user_faucet_path(@faucet), alert: 'Erreur dans la désactivation du robinet.'
      end
    else
      @faucet.archived = false
      if @faucet.save
        redirect_to user_faucet_path(@faucet), notice: 'Robinet activé avec succès.'
      else
        redirect_to user_faucet_path(@faucet), alert: 'Erreur dans l\'activation du robinet.'
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_faucet
    @faucet = Faucet.find(params[:id])
  end



  # Never trust parameters from the scary internet, only allow the white list through.
  def faucet_params
    params.require(:faucet).permit(:number_customer_tag, :other, :note)
  end
end
