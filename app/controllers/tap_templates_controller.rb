class TapTemplatesController < ApplicationController
  before_action :set_tap_template, only: [:show, :edit, :update, :destroy]

  # GET /tap_templates
  # GET /tap_templates.json
  def index
    @tap_templates = TapTemplate.all
  end

  # GET /tap_templates/1
  # GET /tap_templates/1.json
  def show
  end

  # GET /tap_templates/new
  def new
    @tap_template = TapTemplate.new
  end

  # GET /tap_templates/1/edit
  def edit
  end

  # POST /tap_templates
  # POST /tap_templates.json
  def create
    @tap_template = TapTemplate.new(tap_template_params)

    respond_to do |format|
      if @tap_template.save
        format.html { redirect_to @tap_template, notice: 'Tap template was successfully created.' }
        format.json { render :show, status: :created, location: @tap_template }
      else
        format.html { render :new }
        format.json { render json: @tap_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tap_templates/1
  # PATCH/PUT /tap_templates/1.json
  def update
    respond_to do |format|
      if @tap_template.update(tap_template_params)
        format.html { redirect_to @tap_template, notice: 'Tap template was successfully updated.' }
        format.json { render :show, status: :ok, location: @tap_template }
      else
        format.html { render :edit }
        format.json { render json: @tap_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tap_templates/1
  # DELETE /tap_templates/1.json
  def destroy
    @tap_template.destroy
    respond_to do |format|
      format.html { redirect_to tap_templates_url, notice: 'Tap template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tap_template
      @tap_template = TapTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tap_template_params
      params.require(:tap_template).permit(:name, :article_number, :dn, :input_connection, :output_connection, :double_jacket_connection, :inclination_input_offset_output, :face_to_face, :maximal_pressure, :test_pressure, :maximum_temperature, :pressure_at_maximum_temperature, :minimum_temperature, :pressure_at_minimum_temperature, :fluid_nature, :fluid_danger_group, :unstable_gas, :risk_category_according_to_DESP_2014_68, :manual_control, :actuator, :pneumatic_actuator_pressure, :position_detector, :open_position, :close_position, :piloting, :other_instrumentation, :shell, :double_shell, :shutter_cover, :seat, :cable_gland_packing, :seals, :atex, :other_special_requirements, :other_controls, :other)
    end
end
