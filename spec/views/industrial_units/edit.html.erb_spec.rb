require 'rails_helper'

RSpec.describe "industrial_units/edit", type: :view do
  before(:each) do
    @industrial_unit = assign(:industrial_unit, IndustrialUnit.create!(
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

  it "renders the edit industrial_unit form" do
    render

    assert_select "form[action=?][method=?]", industrial_unit_path(@industrial_unit), "post" do

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
