require 'rails_helper'

RSpec.describe "alerts/edit", type: :view do
  before(:each) do
    @alert = assign(:alert, Alert.create!(
      :industrial_unit => nil,
      :tap => nil,
      :kind => 1
    ))
  end

  it "renders the edit alert form" do
    render

    assert_select "form[action=?][method=?]", alert_path(@alert), "post" do

      assert_select "input[name=?]", "alert[industrial_unit_id]"

      assert_select "input[name=?]", "alert[tap_id]"

      assert_select "input[name=?]", "alert[kind]"
    end
  end
end
