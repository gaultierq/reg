class Admin::AlertsController < Admin::MainController
  before_action :set_alert, only: [:show, :edit, :update, :destroy]

  # GET /alerts
  def index
    @alerts = Alert.includes(:faucet, :industrial_unit).all
  end

  # GET /alerts/1
  def show
  end

  # GET /alerts/new
  def new
    @alert = Alert.new
  end

  # GET /alerts/1/edit
  def edit
  end

  # POST /alerts
  def create
    @alert = Alert.new(alert_params)

    if @alert.save
      redirect_to admin_alert_path(@alert), notice: 'Alert was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /alerts/1
  def update
    if @alert.update(alert_params)
      redirect_to admin_alert_path(@alert), notice: 'Alert was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /alerts/1
  def destroy
    @alert.destroy
    redirect_to admin_alerts_url, notice: 'Alert was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alert
      @alert = Alert.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def alert_params
      params.require(:alert).permit(:industrial_unit_id, :faucet_id, :kind, :date)
    end
end
