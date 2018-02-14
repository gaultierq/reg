require 'rails_helper'

RSpec.describe "industrial_units/new", type: :view do
  before(:each) do
    assign(:industrial_unit, IndustrialUnit.new(
      :name => "MyString",
      :address => "MyString",
      :postcode => "MyString",
      :city => "MyString",
      :country => "MyString",
      :latitude => 1.5,
      :longitude => 1.5,
      :additional_information => "MyText",
      :process_information => "MyText"
    ))
  end

  it "renders new industrial_unit form" do
    render

    assert_select "form[action=?][method=?]", industrial_units_path, "post" do

      assert_select "input[name=?]", "industrial_unit[name]"

      assert_select "input[name=?]", "industrial_unit[address]"

      assert_select "input[name=?]", "industrial_unit[postcode]"

      assert_select "input[name=?]", "industrial_unit[city]"

      assert_select "input[name=?]", "industrial_unit[country]"

      assert_select "input[name=?]", "industrial_unit[latitude]"

      assert_select "input[name=?]", "industrial_unit[longitude]"

      assert_select "textarea[name=?]", "industrial_unit[additional_information]"

      assert_select "textarea[name=?]", "industrial_unit[process_information]"
    end
  end
end
