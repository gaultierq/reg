class Admin::IndustrialUnitsController < Admin::BaseController
  before_action :set_industrial_unit, only: [:show, :edit, :update, :destroy]

  # GET /industrial_units
  def index
    @industrial_units = IndustrialUnit.all

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

  # GET /industrial_units/new
  def new
    @industrial_unit = IndustrialUnit.new

    @industrial_unit.admin_industrial_units.build
    @industrial_unit.user_industrial_units.build(user: User.find_by(kind: 'technician'))
    @industrial_unit.user_industrial_units.build(user: User.find_by(kind: 'client'))
  end

  # GET /industrial_units/1/edit
  def edit
  end

  # POST /industrial_units
  def create
    @industrial_unit = IndustrialUnit.new(industrial_unit_params)

    if @industrial_unit.save
      redirect_to admin_industrial_unit_path(@industrial_unit), notice: 'Unité industrielle créée avec succès.'
    else
      render :new
    end
  end

  # PATCH/PUT /industrial_units/1
  def update
    if @industrial_unit.update(industrial_unit_params)
      redirect_to admin_industrial_unit_path(@industrial_unit), notice: 'Unité industrielle modifiée avec succès.'
    else
      render :edit
    end
  end

  # DELETE /industrial_units/1
  def destroy
    @industrial_unit.destroy
    redirect_to admin_industrial_units_url, notice: 'Unité industrielle supprimée avec succès.'
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
