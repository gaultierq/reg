require 'rails_helper'

RSpec.describe "admin/attachments/edit", type: :view do
  before(:each) do
    @admin_attachment = assign(:admin_attachment, Admin::Attachment.create!())
  end

  it "renders the edit admin_attachment form" do
    render

    assert_select "form[action=?][method=?]", admin_attachment_path(@admin_attachment), "post" do
    end
  end
end
