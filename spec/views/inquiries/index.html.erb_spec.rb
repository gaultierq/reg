require 'rails_helper'

RSpec.describe "inquiries/index", type: :view do
  before(:each) do
    assign(:inquiries, [
      Inquiry.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :phone_number => "Phone Number",
        :admin => nil,
        :theme => 2
      ),
      Inquiry.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :phone_number => "Phone Number",
        :admin => nil,
        :theme => 2
      )
    ])
  end

  it "renders a list of inquiries" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
