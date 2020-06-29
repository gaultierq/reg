class Admin::AttachmentsController < Admin::BaseController
  before_action :set_attachment, only: %i[show edit update destroy]

  # GET /admin/attachments
  def index
    @attachments = Attachment.all
  end

  # GET /admin/attachments/1
  def show; end

  # GET /admin/attachments/new
  def new
    @attachment = Attachment.new
  end

  # GET /admin/attachments/1/edit
  def edit; end

  # POST /admin/attachments
  def create
    add_attachments
    ActiveRecord::Base.transaction do
      @attachments.each do |att|
        att.save
      end
    end
    redirect_to admin_attachments_url, notice: 'Documents créé avec succès.'
  end

  def add_attachments

    dummy_params = params[:attachment].clone

    # TODO: clean up the interface
    dummy_params["new_" + dummy_params[:categ] + "_attachment"] = dummy_params[:pdf]

    @attachments = Attachment.prepare_attach(
        dummy_params,
        Attachment.categs
    )
  end

  # DELETE /admin/attachments/1
  def destroy
    @attachment.destroy
    redirect_to admin_attachments_url, notice: 'Document supprimé avec succès.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_attachment
    @attachment = Attachment.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def attachment_params
    params.require(:attachment).permit(:categ, :pdf)
  end
end
