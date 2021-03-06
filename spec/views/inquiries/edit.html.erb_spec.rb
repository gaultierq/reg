require 'rails_helper'

RSpec.describe "inquiries/edit", type: :view do
  before(:each) do
    @inquiry = assign(:inquiry, Inquiry.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :phone_number => "MyString",
      :admin => nil,
      :theme => 1
    ))
  end

  it "renders the edit inquiry form" do
    render

    assert_select "form[action=?][method=?]", inquiry_path(@inquiry), "post" do

      assert_select "input[name=?]", "inquiry[first_name]"

      assert_select "input[name=?]", "inquiry[last_name]"

      assert_select "input[name=?]", "inquiry[email]"

      assert_select "input[name=?]", "inquiry[phone_number]"

      assert_select "input[name=?]", "inquiry[admin_id]"

      assert_select "input[name=?]", "inquiry[theme]"
    end
  end
end
