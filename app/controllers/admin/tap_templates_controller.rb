class Admin::TapTemplatesController < Admin::BaseController
  before_action :set_tap_template, only: [:show, :edit, :update, :destroy]
  helper_method :selected_attachment

  # GET /tap_templates
  def index
    @tap_templates = TapTemplate.all
  end

  # GET /tap_templates/1
  def show
    @browser = Browser.new(request.env['HTTP_USER_AGENT'])
  end

  # GET /tap_templates/new
  def new
    @tap_template = TapTemplate.new
  end


  # GET /tap_templates/new_from_params
  def new_from_params
    @tap_template = TapTemplate.new(tap_template_params)
    respond_to do |format|
      format.html { render :template => "tap_template/new" }
    end
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
    attachments = Attachment.prepare_attach(params[:tap_template], TapTemplateAttachment.kinds)
    @tap_template.attachments.delete_all
    @tap_template.attachments << attachments
  end

  def selected_attachment(kind)
    @tap_template.attachments.where_kind(kind).ids
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
  def set_tap_template
    @tap_template = TapTemplate.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tap_template_params
    params.require(:tap_template).permit(:template_name, :name, :article_number, :dn, :input_connection, :output_connection, :double_jacket_connection, :inclination_input_offset_output, :face_to_face, :maximal_pressure, :test_pressure, :maximum_temperature, :pressure_at_maximum_temperature, :minimum_temperature, :pressure_at_minimum_temperature, :fluid_nature, :fluid_danger_group, :unstable_gas, :risk_category, :manual_control, :actuator, :pneumatic_actuator_pressure, :position_detector, :open_position, :close_position, :piloting, :other_instrumentation, :shell, :double_shell, :shutter_cover, :seat, :cable_gland_packing, :seals, :atex, :other_special_requirements, :other_controls, :other)
  end
end
