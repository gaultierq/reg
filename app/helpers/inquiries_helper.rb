module InquiriesHelper

  def is_readonly(field)
    @inquiry[field].present?
  end

  def is_logged
    current_user || current_admin
  end

end
