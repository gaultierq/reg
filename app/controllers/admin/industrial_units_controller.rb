class Admin::IndustrialUnitsController < Admin::BaseController
  before_action :set_industrial_unit, only: [:show, :edit, :update, :destroy]

  # GET /industrial_units
  def index
    if params[:industrial_unit_id].present?
      @industrial_unit = Faucet.find(params[:industrial_unit_id])
      if @industrial_unit.present?
        redirect_to admin_industrial_unit_path(@industrial_unit)
        return
      end

    end

    if params[:industrial_unit].present?
      @faucets = Faucet.where(industrial_unit_id: params[:industrial_unit]).all
    else
      @faucets = Faucet.where.not(industrial_unit_id: nil).all
    end
    

    browser = Browser.new(request.env['HTTP_USER_AGENT'])
    request.variant = :mobile if browser.platform.android_app? || browser.platform.ios_app?

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
      add_associations
      redirect_to admin_industrial_unit_path(@industrial_unit), notice: 'Unité industrielle créée avec succès.'
    else
      render :new
    end
  end

  # PATCH/PUT /industrial_units/1
  def update
    if @industrial_unit.update(industrial_unit_params)
      add_associations
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

  def index_mobile
    @industrial_units = IndustrialUnit.all
    @faucets = Faucet.all
  end

  def add_associations
    admins = []
    users = []
    if params[:industrial_unit].present?
      if params[:industrial_unit][:admin_id].present?
        admins << Admin.where(id: params[:industrial_unit][:admin_id])
      end
      @industrial_unit.admins.delete_all
      @industrial_unit.admins << admins

      if params[:industrial_unit][:user_id].present?
        users << User.where(id: params[:industrial_unit][:user_id])
      end
      @industrial_unit.users.delete_all
      @industrial_unit.users << users
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_industrial_unit
      @industrial_unit = IndustrialUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def industrial_unit_params
      params.require(:industrial_unit).permit(:name, :address, :postcode, :city, :country, :additional_information, :process_information, :sign_in_perimeter, :latitude, :longitude)
    end
end
