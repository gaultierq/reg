class Admin::EventsController < Admin::BaseController
  before_action :set_event, only: %i[show edit update destroy]

  # GET /events
  def index
    @events = Event.includes(:admin, :user, faucet: :industrial_unit).all
  end

  # GET /events/1
  def show; end

  # GET /events/new
  def new
    @event = Event.new
    if params[:faucet_id].present?
      @event.faucet = Faucet.find(params[:faucet_id])
    end
  end

  # GET /events/1/edit
  def edit; end

  # POST /events
  def create
    @event = current_user.present? ? current_user.events.new(event_params) : current_admin.events.new(event_params)

    if @event.save
      add_attachments
      redirect_to admin_event_path(@event), notice: 'Évènement créé avec succès.'
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      add_attachments
      redirect_to admin_event_path(@event), notice: 'Évènement modifié avec succès.'
    else
      render :edit
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    redirect_to admin_events_url, notice: 'Évènement supprimé avec succès.'
  end

  def add_attachments
    attachments = []
    if params[:event].present?
      if params[:event][:existing_event_attachment].present?
        attachments << Attachment.where(id: params[:event][:existing_event_attachment].drop(1))
      end

      if params[:event][:new_event_attachment].present?
        params[:event][:new_event_attachment].each do |attachment|
          attachment_to_add = Attachment.new(kind: :incident_maintenance, pdf: attachment)
          if attachment_to_add.save
            attachments << attachment_to_add
          else
            check_uniqueness(attachments, attachment_to_add)
          end
        end
      end

      @event.attachments.delete_all
      @event.attachments << attachments
    end
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
  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:faucet_id, :kind, :comment)
  end
end
