require 'rails_helper'

RSpec.describe "alerts/show", type: :view do
  before(:each) do
    @alert = assign(:alert, Alert.create!(
      :industrial_unit => nil,
      :tap => nil,
      :kind => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
