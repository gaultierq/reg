class InquiriesController < ApplicationController
  layout 'inquiry'
  before_action :set_inquiry, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, except: [:new, :create]

  # GET /inquiries
  def index
    @inquiries = Inquiry.all
  end

  # GET /inquiries/1
  def show
  end

  # GET /inquiries/new
  def new
    @inquiry = Inquiry.new

    user = current_user || current_admin
    @inquiry.attributes = user.attributes.slice(*Inquiry.attribute_names) if user

    # TODO: confusion, change "admin" in "referral"
    invited_by_id = user&.invited_by_id
    @inquiry.admin = Admin.find(invited_by_id) if invited_by_id

    @inquiry.theme = params[:theme]

    puts @inquiry.attributes

  end

  # GET /inquiries/1/edit
  def edit
  end

  # POST /inquiries
  def create
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.user = current_user

    if @inquiry.save

      get_emails.each do |email|
        InquiryMailer.inquiry_email(email, @inquiry, false).deliver_later
      end

      # sending a copy to the person making the query
      InquiryMailer.inquiry_email(@inquiry.email, @inquiry, true).deliver_later

      if @inquiry.theme == 'inscription'
        redirect_to new_user_session_path, notice: "Demande d'inscription envoyée."
      else
        redirect_to root_path, notice: "Demande d'information envoyée."
      end

    else
      render :new
    end
  end

  # PATCH/PUT /inquiries/1
  def update
    if @inquiry.update(inquiry_params)
      redirect_to @inquiry, notice: 'Inquiry was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /inquiries/1
  def destroy
    @inquiry.destroy
    redirect_to inquiries_url, notice: 'Inquiry was successfully destroyed.'
  end

  private

  def get_emails
    emails = [ENV["FORM_CONTACT_EMAIL"]]
    emails << @inquiry.admin.email if @inquiry.admin
    emails += current_user.industrial_units.flat_map { |iu| iu.admins.map(&:email) } if current_user
    emails.compact.uniq
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_inquiry
    @inquiry = Inquiry.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def inquiry_params
    params.require(:inquiry).permit(:first_name, :last_name, :email, :phone_number, :admin_id, :theme, :message)
  end
end
