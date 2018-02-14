require 'rails_helper'

RSpec.describe "industrial_units/index", type: :view do
  before(:each) do
    assign(:industrial_units, [
      IndustrialUnit.create!(
        :name => "Name",
        :address => "Address",
        :postcode => "Postcode",
        :city => "City",
        :country => "Country",
        :latitude => 2.5,
        :longitude => 3.5,
        :additional_information => "MyText",
        :process_information => "MyText"
      ),
      IndustrialUnit.create!(
        :name => "Name",
        :address => "Address",
        :postcode => "Postcode",
        :city => "City",
        :country => "Country",
        :latitude => 2.5,
        :longitude => 3.5,
        :additional_information => "MyText",
        :process_information => "MyText"
      )
    ])
  end

  it "renders a list of industrial_units" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Postcode".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
