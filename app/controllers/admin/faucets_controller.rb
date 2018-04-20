class Admin::FaucetsController < Admin::MainController
  before_action :set_faucet, only: [:show, :edit, :update, :destroy]

  # GET /faucets
  def index
    @faucets = Faucet.includes(:industrial_unit).where(industrial_unit: nil).all
  end

  # GET /faucets/1
  def show
  end

  # GET /faucets/new
  def new
    @faucet = Faucet.new(TapTemplate.find_by_id(params[:tap_template_id])&.attributes)
  end

  # GET /faucets/1/edit
  def edit
  end

  # POST /faucets
  def create
    @faucet = Faucet.new(faucet_params)

    if @faucet.save
      redirect_to admin_faucet_path(@faucet), notice: 'Faucet was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /faucets/1
  def update
    if @faucet.update(faucet_params)
      redirect_to admin_faucet_path(@faucet), notice: 'Faucet was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /faucets/1
  def destroy
    @faucet.destroy
    redirect_to admin_faucets_url, notice: 'Faucet was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faucet
      @faucet = Faucet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def faucet_params
      params.require(:faucet).permit(:name, :rfid_number, :serial_number, :number_customer_tag, :manufacturing_date, :sales_number, :customer_order_number, :article_number, :industrial_unit_id, :dn, :input_connection, :output_connection, :double_jacket_connection, :inclination_input_offset_output, :face_to_face, :maximal_pressure, :test_pressure, :maximum_temperature, :pressure_at_maximum_temperature, :minimum_temperature, :pressure_at_minimum_temperature, :fluid_name, :pressure, :temperature, :fluid_nature, :fluid_danger_group, :unstable_gas, :risk_category, :manual_control, :actuator, :pneumatic_actuator_pressure, :position_detector, :open_position, :close_position, :piloting, :other_instrumentation, :shell, :double_shell, :shutter_cover, :seat, :cable_gland_packing, :seals, :material_certificates_required, :atex, :other_special_requirements, :other_controls, :other)
    end
end
