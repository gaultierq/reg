class Admin::TapsController < Admin::ApplicationController
  before_action :set_tap, only: [:show, :edit, :update, :destroy]

  # GET /taps
  def index
    @taps = Tap.includes(:industrial_unit).all
  end

  # GET /taps/1
  def show
  end

  # GET /taps/new
  def new
    @tap = Tap.new(TapTemplate.find_by_id(params[:tap_template_id])&.attributes)
  end

  # GET /taps/1/edit
  def edit
  end

  # POST /taps
  def create
    @tap = Tap.new(tap_params)

    if @tap.save
      redirect_to @tap, notice: 'Tap was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /taps/1
  def update
    if @tap.update(tap_params)
      redirect_to @tap, notice: 'Tap was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /taps/1
  def destroy
    @tap.destroy
    redirect_to taps_url, notice: 'Tap was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tap
      @tap = Tap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tap_params
      params.require(:tap).permit(:name, :rfid_number, :serial_number, :number_customer_tag, :manufacturing_date, :sales_number, :customer_order_number, :article_number, :industrial_unit_id, :dn, :input_connection, :output_connection, :double_jacket_connection, :inclination_input_offset_output, :face_to_face, :maximal_pressure, :test_pressure, :maximum_temperature, :pressure_at_maximum_temperature, :minimum_temperature, :pressure_at_minimum_temperature, :fluid_name, :pressure, :temperature, :fluid_nature, :fluid_danger_group, :unstable_gas, :risk_category, :manual_control, :actuator, :pneumatic_actuator_pressure, :position_detector, :open_position, :close_position, :piloting, :other_instrumentation, :shell, :double_shell, :shutter_cover, :seat, :cable_gland_packing, :seals, :material_certificates_required, :atex, :other_special_requirements, :other_controls, :other)
    end
end
