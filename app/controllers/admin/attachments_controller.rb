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
    @attachment = Attachment.new(attachment_params)

    if @attachment.save
      redirect_to admin_attachment_path(@attachment), notice: 'Attachment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/attachments/1
  def update
    if @attachment.update(attachment_params)
      redirect_to admin_attachment_path(@attachment), notice: 'Attachment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/attachments/1
  def destroy
    @attachment.destroy
    redirect_to admin_attachments_url, notice: 'Attachment was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_attachment
    @attachment = Attachment.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def attachment_params
    params.require(:attachment).permit(:kind, :pdf)
  end
end
