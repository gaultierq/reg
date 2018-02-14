class IndustrialUnitsController < ApplicationController
  before_action :set_industrial_unit, only: [:show, :edit, :update, :destroy]

  # GET /industrial_units
  # GET /industrial_units.json
  def index
    @industrial_units = IndustrialUnit.all
  end

  # GET /industrial_units/1
  # GET /industrial_units/1.json
  def show
  end

  # GET /industrial_units/new
  def new
    @industrial_unit = IndustrialUnit.new
  end

  # GET /industrial_units/1/edit
  def edit
  end

  # POST /industrial_units
  # POST /industrial_units.json
  def create
    @industrial_unit = IndustrialUnit.new(industrial_unit_params)

    respond_to do |format|
      if @industrial_unit.save
        format.html { redirect_to @industrial_unit, notice: 'Industrial unit was successfully created.' }
        format.json { render :show, status: :created, location: @industrial_unit }
      else
        format.html { render :new }
        format.json { render json: @industrial_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /industrial_units/1
  # PATCH/PUT /industrial_units/1.json
  def update
    respond_to do |format|
      if @industrial_unit.update(industrial_unit_params)
        format.html { redirect_to @industrial_unit, notice: 'Industrial unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @industrial_unit }
      else
        format.html { render :edit }
        format.json { render json: @industrial_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /industrial_units/1
  # DELETE /industrial_units/1.json
  def destroy
    @industrial_unit.destroy
    respond_to do |format|
      format.html { redirect_to industrial_units_url, notice: 'Industrial unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_industrial_unit
      @industrial_unit = IndustrialUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def industrial_unit_params
      params.require(:industrial_unit).permit(:name, :address, :postcode, :city, :country, :additional_information, :process_information)
    end
end
