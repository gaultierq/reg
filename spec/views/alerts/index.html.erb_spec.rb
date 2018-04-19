require 'rails_helper'

RSpec.describe "alerts/index", type: :view do
  before(:each) do
    assign(:alerts, [
      Alert.create!(
        :industrial_unit => nil,
        :tap => nil,
        :kind => 2
      ),
      Alert.create!(
        :industrial_unit => nil,
        :tap => nil,
        :kind => 2
      )
    ])
  end

  it "renders a list of alerts" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
