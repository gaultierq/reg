require 'rails_helper'

RSpec.describe "admin/attachments/new", type: :view do
  before(:each) do
    assign(:admin_attachment, Admin::Attachment.new())
  end

  it "renders new admin_attachment form" do
    render

    assert_select "form[action=?][method=?]", admin_attachments_path, "post" do
    end
  end
end
