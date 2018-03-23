class Admin::IndustrialUnitsController < Admin::ApplicationController
  before_action :set_industrial_unit, only: [:show, :edit, :update, :destroy]

  # GET /industrial_units
  def index
    @industrial_units = IndustrialUnit.all
  end

  # GET /industrial_units/1
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
  def create
    @industrial_unit = IndustrialUnit.new(industrial_unit_params)

    if @industrial_unit.save
      redirect_to @industrial_unit, notice: 'Industrial unit was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /industrial_units/1
  def update
    if @industrial_unit.update(industrial_unit_params)
      redirect_to @industrial_unit, notice: 'Industrial unit was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /industrial_units/1
  def destroy
    @industrial_unit.destroy
    redirect_to industrial_units_url, notice: 'Industrial unit was successfully destroyed.'
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
