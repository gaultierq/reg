class Admin::FaucetsController < Admin::BaseController
  before_action :set_faucet, only: [:show, :edit, :update, :destroy]

  # GET /faucets
  def index
    if params[:rfid_number].present?
      @faucet = Faucet.find_by(rfid_number: params[:rfid_number])
      if @faucet.present?
        redirect_to admin_faucet_path(@faucet)
        return
      end
    elsif params[:faucet_id].present?
      @faucet = Faucet.find(params[:faucet_id])
      if @faucet.present?
        redirect_to admin_faucet_path(@faucet)
        return
      end
    end

    browser = Browser.new(request.env['HTTP_USER_AGENT'])
    if browser.platform.android_app? || browser.platform.ios_app?
      redirect_to index_mobile_admin_industrial_units_path
      return
    end

    @faucets = Faucet.includes(:industrial_unit).where(industrial_unit: nil).all

    respond_to do |format|
      format.html
      format.csv { send_data @faucets.to_csv, filename: "Robinets non affectés #{Date.today}.csv" }
    end
  end

  # GET /faucets/1
  def show
  end

  # GET /faucets/new
  def new
    @faucet = Faucet.new(TapTemplate.find_by_id(params[:tap_template_id])&.attributes)
    @tap_template = TapTemplate.find_by_id(params[:tap_template_id])
  end

  # GET /faucets/1/edit
  def edit
  end

  # POST /faucets
  def create
    @faucet = Faucet.new(faucet_params)

    if @faucet.save
      add_attachments
      redirect_to admin_faucet_path(@faucet), notice: 'Robinet créé avec succès.'
    else
      render :new
    end
  end

  # PATCH/PUT /faucets/1
  def update
    if @faucet.update(faucet_params)
      add_attachments
      redirect_to admin_faucet_path(@faucet), notice: 'Robinet modifié avec succès.'
    else
      render :edit
    end
  end

  # DELETE /faucets/1
  def destroy
    @faucet.destroy
    redirect_to admin_faucets_url, notice: 'Robinet supprimé avec succès.'
  end

  def duplicate
    if params.has_key?(:number)
      params[:number].to_i.times do |i|
        @faucet = Faucet.find(params[:id]).dup
        @faucet.serial_number = Faucet.where.not(serial_number: nil).order(serial_number: :desc).first.serial_number + 1
        @faucet.save
      end
      redirect_to admin_faucets_path, notice: 'Robinets dupliqués avec succès.'
    else
      @faucet = Faucet.find(params[:id]).dup
      @faucet.serial_number = Faucet.where.not(serial_number: nil).order(serial_number: :desc).first.serial_number + 1
      if @faucet.save
        redirect_to admin_faucet_path(@faucet), notice: 'Robinet dupliqué avec succès.'
      end
    end
  end

  def add_attachments
    attachments = []
    notices = []
    if params[:faucet].present?
      if params[:faucet][:existing_instruction_service_attachment].present?
        attachments << Attachment.where(id: params[:faucet][:existing_instruction_service_attachment].drop(1))
      end
      if params[:faucet][:existing_actionnement_actionneur_attachment].present?
        attachments << Attachment.where(id: params[:faucet][:existing_actionnement_actionneur_attachment].drop(1))
      end
      if params[:faucet][:existing_instrumentation_position_attachment].present?
        attachments << Attachment.where(id: params[:faucet][:existing_instrumentation_position_attachment].drop(1))
      end
      if params[:faucet][:existing_instrumentation_pilotage_attachment].present?
        attachments << Attachment.where(id: params[:faucet][:existing_instrumentation_pilotage_attachment].drop(1))
      end
      if params[:faucet][:existing_instrumentation_autre_attachment].present?
        attachments << Attachment.where(id: params[:faucet][:existing_instrumentation_autre_attachment].drop(1))
      end
      if params[:faucet][:new_instruction_service_attachment].present?
        params[:faucet][:new_instruction_service_attachment].each do |attachment|
          attachment_to_add = Attachment.new(kind: :instruction_service, pdf: attachment)
          if attachment_to_add.save
            attachments << attachment_to_add
          else
            check_uniqueness(attachments, attachment_to_add)
          end
        end
      end
      if params[:faucet][:new_actionnement_actionneur_attachment].present?
        params[:faucet][:new_actionnement_actionneur_attachment].each do |attachment|
          attachment_to_add = Attachment.new(kind: :actionnement_actionneur, pdf: attachment)
          if attachment_to_add.save
            attachments << attachment_to_add
          else
            check_uniqueness(attachments, attachment_to_add)
          end
        end
      end
      if params[:faucet][:new_instrumentation_position_attachment].present?
        params[:faucet][:new_instrumentation_position_attachment].each do |attachment|
          attachment_to_add = Attachment.new(kind: :instrumentation_position, pdf: attachment)
          if attachment_to_add.save
            attachments << attachment_to_add
          else
            check_uniqueness(attachments, attachment_to_add)
          end
        end
      end
      if params[:faucet][:new_instrumentation_pilotage_attachment].present?
        params[:faucet][:new_instrumentation_pilotage_attachment].each do |attachment|
          attachment_to_add = Attachment.new(kind: :instrumentation_pilotage, pdf: attachment)
          if attachment_to_add.save
            attachments << attachment_to_add
          else
            check_uniqueness(attachments, attachment_to_add)
          end
        end
      end
      if params[:faucet][:new_instrumentation_autre_attachment].present?
        params[:faucet][:new_instrumentation_autre_attachment].each do |attachment|
          attachment_to_add = Attachment.new(kind: :instrumentation_autre, pdf: attachment)
          if attachment_to_add.save
            attachments << attachment_to_add
          else
            check_uniqueness(attachments, attachment_to_add)
          end
        end
      end
    end
    @faucet.attachments.delete_all
    @faucet.attachments << attachments
  end

  def check_uniqueness(attachments, attachment_to_add)
    found_attachment = Attachment.find_by(md5: attachment_to_add.md5)
    contains = false
    attachments.each do |relation|
      if relation.find_by(md5: found_attachment.md5).present?
        contains = true
      end
    end
    if found_attachment.present? && !contains
      attachments << found_attachment
    end
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
