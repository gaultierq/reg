require 'rails_helper'

RSpec.describe "industrial_units/show", type: :view do
  before(:each) do
    @industrial_unit = assign(:industrial_unit, IndustrialUnit.create!(
      :name => "Name",
      :address => "Address",
      :postcode => "Postcode",
      :city => "City",
      :country => "Country",
      :latitude => 2.5,
      :longitude => 3.5,
      :additional_information => "MyText",
      :process_information => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Postcode/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
