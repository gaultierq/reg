require 'rails_helper'

RSpec.describe "admin/attachments/index", type: :view do
  before(:each) do
    assign(:admin_attachments, [
      Admin::Attachment.create!(),
      Admin::Attachment.create!()
    ])
  end

  it "renders a list of admin/attachments" do
    render
  end
end
