require 'rails_helper'

RSpec.describe "admin/attachments/show", type: :view do
  before(:each) do
    @admin_attachment = assign(:admin_attachment, Admin::Attachment.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
