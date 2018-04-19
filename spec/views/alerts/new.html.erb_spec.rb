require 'rails_helper'

RSpec.describe "alerts/new", type: :view do
  before(:each) do
    assign(:alert, Alert.new(
      :industrial_unit => nil,
      :tap => nil,
      :kind => 1
    ))
  end

  it "renders new alert form" do
    render

    assert_select "form[action=?][method=?]", alerts_path, "post" do

      assert_select "input[name=?]", "alert[industrial_unit_id]"

      assert_select "input[name=?]", "alert[tap_id]"

      assert_select "input[name=?]", "alert[kind]"
    end
  end
end
