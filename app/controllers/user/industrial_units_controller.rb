class User::IndustrialUnitsController < User::BaseController
  before_action :set_industrial_unit, only: [:show]

  # GET /industrial_units
  def index
    if params[:industrial_unit_id].present?
      @industrial_unit = Faucet.find(params[:industrial_unit_id])
      if @industrial_unit.present?
        redirect_to user_industrial_unit_path(@industrial_unit)
        return
      end
    end

    @industrial_units = current_user.industrial_units

    respond_to do |format|
      format.html
      format.csv { send_data @industrial_units.to_csv, filename: "Unités industrielles #{Date.today}.csv" }
    end
  end

  # GET /industrial_units/1
  def show
    respond_to do |format|
      format.html
      format.csv { send_data @industrial_unit.to_csv, filename: "#{@industrial_unit.name} #{Date.today}.csv" }
    end
  end

  def index_mobile
    @industrial_units = IndustrialUnit.all
    @faucets = Faucet.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_industrial_unit
      @industrial_unit = IndustrialUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def industrial_unit_params
      params.require(:industrial_unit).permit(:name, :address, :postcode, :city, :country, :additional_information, :process_information,
                                              user_industrial_units_attributes: :user_id, admin_industrial_units_attributes: :admin_id)
    end
end
