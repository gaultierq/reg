require 'rails_helper'

RSpec.describe "inquiries/show", type: :view do
  before(:each) do
    @inquiry = assign(:inquiry, Inquiry.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :phone_number => "Phone Number",
      :admin => nil,
      :theme => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
