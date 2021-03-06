class User::EventsController < User::BaseController
  before_action :set_event, only: %i[show edit update destroy]
  helper_method :selected_attachment

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
      redirect_to user_event_path(@event), notice: 'Évènement créé avec succès.'
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      add_attachments
      redirect_to user_event_path(@event), notice: 'Évènement modifié avec succès.'
    else
      render :edit
    end
  end

  # DELETE /events/1
  def destroy
    faucet = @event.faucet
    @event.destroy
    redirect_to user_faucet_path(faucet), notice: 'Évènement supprimé avec succès.'
  end

  private

  def add_attachments
    attachments = Attachment.prepare_attach(
        params[:event],
        EventAttachment.kinds
    )
    @event.attachments.delete_all
    @event.attachments << attachments
  end

  def selected_attachment(kind)
    @event.attachments.where_kind(kind).ids
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:faucet_id, :kind, :comment)
  end
end
