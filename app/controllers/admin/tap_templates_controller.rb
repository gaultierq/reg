class Admin::TapTemplatesController < Admin::BaseController
  before_action :set_tap_template, only: [:show, :edit, :update, :destroy]

  # GET /tap_templates
  def index
    @tap_templates = TapTemplate.all
  end

  # GET /tap_templates/1
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
  def create
    @tap_template = TapTemplate.new(tap_template_params)

    if @tap_template.save
      add_attachments
      redirect_to admin_tap_template_path(@tap_template), notice: 'Modèle créé avec succès.'
    else
      render :new
    end
  end

  # PATCH/PUT /tap_templates/1
  def update
    if @tap_template.update(tap_template_params)
      add_attachments
      redirect_to admin_tap_template_path(@tap_template), notice: 'Modèle modifié avec succès.'
    else
      render :edit
    end
  end

  # DELETE /tap_templates/1
  def destroy
    @tap_template.destroy
    redirect_to admin_tap_templates_url, notice: 'Modèle supprimé avec succès.'
  end

  def add_attachments
    attachments = []
    if params[:tap_template].present?
      if params[:tap_template][:existing_instruction_service_attachment].present?
        attachments << Attachment.where(id: params[:tap_template][:existing_instruction_service_attachment].drop(1))
      end
      if params[:tap_template][:existing_actionnement_actionneur_attachment].present?
        attachments << Attachment.where(id: params[:tap_template][:existing_actionnement_actionneur_attachment].drop(1))
      end
      if params[:tap_template][:existing_instrumentation_position_attachment].present?
        attachments << Attachment.where(id: params[:tap_template][:existing_instrumentation_position_attachment].drop(1))
      end
      if params[:tap_template][:existing_instrumentation_pilotage_attachment].present?
        attachments << Attachment.where(id: params[:tap_template][:existing_instrumentation_pilotage_attachment].drop(1))
      end
      if params[:tap_template][:existing_instrumentation_autre_attachment].present?
        attachments << Attachment.where(id: params[:tap_template][:existing_instrumentation_autre_attachment].drop(1))
      end
      if params[:tap_template][:new_instruction_service_attachment].present?
        params[:tap_template][:new_instruction_service_attachment].each do |pdf|
          attachment = Attachment.new(kind: :instruction_service, pdf: pdf)
          if attachment.save
            attachments << attachment
          end
        end
      end
      if params[:tap_template][:new_actionnement_actionneur_attachment].present?
        params[:tap_template][:new_actionnement_actionneur_attachment].each do |pdf|
          attachment = Attachment.new(kind: :actionnement_actionneur, pdf: pdf)
          if attachment.save
            attachments << attachment
          end
        end
      end
      if params[:tap_template][:new_instrumentation_position_attachment].present?
        params[:tap_template][:new_instrumentation_position_attachment].each do |pdf|
          attachment = Attachment.new(kind: :instrumentation_position, pdf: pdf)
          if attachment.save
            attachments << attachment
          end
        end
      end
      if params[:tap_template][:new_instrumentation_pilotage_attachment].present?
        params[:tap_template][:new_instrumentation_pilotage_attachment].each do |pdf|
          attachment = Attachment.new(kind: :instrumentation_pilotage, pdf: pdf)
          if attachment.save
            attachments << attachment
          end
        end
      end
      if params[:tap_template][:new_instrumentation_autre_attachment].present?
        params[:tap_template][:new_instrumentation_autre_attachment].each do |pdf|
          attachment = Attachment.new(kind: :instrumentation_autre, pdf: pdf)
          if attachment.save
            attachments << attachment
          end
        end
      end
    end
    @tap_template.attachments.delete_all
    @tap_template.attachments << attachments
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tap_template
      @tap_template = TapTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tap_template_params
      params.require(:tap_template).permit(:name, :article_number, :dn, :input_connection, :output_connection, :double_jacket_connection, :inclination_input_offset_output, :face_to_face, :maximal_pressure, :test_pressure, :maximum_temperature, :pressure_at_maximum_temperature, :minimum_temperature, :pressure_at_minimum_temperature, :fluid_nature, :fluid_danger_group, :unstable_gas, :risk_category, :manual_control, :actuator, :pneumatic_actuator_pressure, :position_detector, :open_position, :close_position, :piloting, :other_instrumentation, :shell, :double_shell, :shutter_cover, :seat, :cable_gland_packing, :seals, :atex, :other_special_requirements, :other_controls, :other)
    end
end
