class Admin::TechniciansController < Admin::ApplicationController
  before_action :set_technician, only: [:show, :edit, :update, :destroy]

  # GET /technicians/1
  def show
  end

  # GET /technicians/new
  def new
    @technician = Technician.new
  end

  # GET /technicians/1/edit
  def edit
  end

  # POST /technicians
  def create
    @technician = Technician.new(technician_params)

    if @technician.save
      redirect_to admin_technician_path(@technician), notice: 'Technician was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /technicians/1
  def update
    if @technician.update(technician_params)
      redirect_to admin_technician_path(@technician), notice: 'Technician was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /technicians/1
  def destroy
    @technician.destroy
    redirect_to admin_users_url, notice: 'Technician was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_technician
      @technician = Technician.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def technician_params
      params.require(:technician).permit(:email, :password, :password_confirmation)
    end
end
