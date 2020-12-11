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


    @inquiry.user = current_user

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

    if @inquiry.save

      emails = @inquiry.user&.industrial_units.flat_map { |iu|  iu.admins.map(&:email) }
      emails += [ENV["FORM_CONTACT_EMAIL"], @inquiry.admin&.email]
      emails = emails.compact.uniq
      puts "sending emails to #{emails}"

      # sending a copy to the main address
      InquiryMailer.inquiry_email(ENV["FORM_CONTACT_EMAIL"], @inquiry, false).deliver_now

      InquiryMailer.inquiry_email(@inquiry.admin&.email, @inquiry, false).deliver_now

      # sending a copy to the person making the query
      InquiryMailer.inquiry_email(@inquiry.email, @inquiry, true).deliver_now

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

  # Use callbacks to share common setup or constraints between actions.
    def set_inquiry
      @inquiry = Inquiry.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def inquiry_params
      params.require(:inquiry).permit(:first_name, :last_name, :email, :phone_number, :admin_id, :theme, :message)
    end
end
