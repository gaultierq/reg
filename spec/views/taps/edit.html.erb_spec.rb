require 'rails_helper'

RSpec.describe "faucets/edit", type: :view do
  before(:each) do
    @tap = assign(:tap, Faucet.create!(
      :name => "MyString",
      :rfid_number => "MyString",
      :serial_number => 1,
      :number_customer_tag => 1,
      :sales_number => "MyString",
      :customer_order_number => "MyString",
      :article_number => "MyString",
      :industrial_unit => nil,
      :dn => "MyString",
      :input_connection => "MyString",
      :output_connection => "MyString",
      :double_jacket_connection => "MyString",
      :inclination_input_offset_output => "MyString",
      :face_to_face => "MyString",
      :maximal_pressure => 1.5,
      :test_pressure => 1.5,
      :maximum_temperature => 1.5,
      :pressure_at_maximum_temperature => 1.5,
      :minimum_temperature => 1.5,
      :pressure_at_minimum_temperature => 1.5,
      :fluid_name => "MyString",
      :pressure => 1.5,
      :temperature => 1.5,
      :fluid_nature => 1,
      :fluid_danger_group => 1,
      :unstable_gas => false,
      :risk_category => 1,
      :manual_control => "MyString",
      :actuator => "MyString",
      :pneumatic_actuator_pressure => 1.5,
      :position_detector => "MyString",
      :open_position => "MyString",
      :close_position => "MyString",
      :piloting => "MyString",
      :other_instrumentation => "MyString",
      :shell => "MyString",
      :double_shell => "MyString",
      :shutter_cover => "MyString",
      :seat => "MyString",
      :cable_gland_packing => "MyString",
      :seals => "MyString",
      :material_certificates_required => false,
      :atex => "MyString",
      :other_special_requirements => "MyString",
      :other_controls => "MyString",
      :other => "MyString"
    ))
  end

  it "renders the edit tap form" do
    render

    assert_select "form[action=?][method=?]", tap_path(@tap), "post" do

      assert_select "input[name=?]", "tap[name]"

      assert_select "input[name=?]", "tap[rfid_number]"

      assert_select "input[name=?]", "tap[serial_number]"

      assert_select "input[name=?]", "tap[number_customer_tag]"

      assert_select "input[name=?]", "tap[sales_number]"

      assert_select "input[name=?]", "tap[customer_order_number]"

      assert_select "input[name=?]", "tap[article_number]"

      assert_select "input[name=?]", "tap[industrial_unit_id]"

      assert_select "input[name=?]", "tap[dn]"

      assert_select "input[name=?]", "tap[input_connection]"

      assert_select "input[name=?]", "tap[output_connection]"

      assert_select "input[name=?]", "tap[double_jacket_connection]"

      assert_select "input[name=?]", "tap[inclination_input_offset_output]"

      assert_select "input[name=?]", "tap[face_to_face]"

      assert_select "input[name=?]", "tap[maximal_pressure]"

      assert_select "input[name=?]", "tap[test_pressure]"

      assert_select "input[name=?]", "tap[maximum_temperature]"

      assert_select "input[name=?]", "tap[pressure_at_maximum_temperature]"

      assert_select "input[name=?]", "tap[minimum_temperature]"

      assert_select "input[name=?]", "tap[pressure_at_minimum_temperature]"

      assert_select "input[name=?]", "tap[fluid_name]"

      assert_select "input[name=?]", "tap[pressure]"

      assert_select "input[name=?]", "tap[temperature]"

      assert_select "input[name=?]", "tap[fluid_nature]"

      assert_select "input[name=?]", "tap[fluid_danger_group]"

      assert_select "input[name=?]", "tap[unstable_gas]"

      assert_select "input[name=?]", "tap[risk_category]"

      assert_select "input[name=?]", "tap[manual_control]"

      assert_select "input[name=?]", "tap[actuator]"

      assert_select "input[name=?]", "tap[pneumatic_actuator_pressure]"

      assert_select "input[name=?]", "tap[position_detector]"

      assert_select "input[name=?]", "tap[open_position]"

      assert_select "input[name=?]", "tap[close_position]"

      assert_select "input[name=?]", "tap[piloting]"

      assert_select "input[name=?]", "tap[other_instrumentation]"

      assert_select "input[name=?]", "tap[shell]"

      assert_select "input[name=?]", "tap[double_shell]"

      assert_select "input[name=?]", "tap[shutter_cover]"

      assert_select "input[name=?]", "tap[seat]"

      assert_select "input[name=?]", "tap[cable_gland_packing]"

      assert_select "input[name=?]", "tap[seals]"

      assert_select "input[name=?]", "tap[material_certificates_required]"

      assert_select "input[name=?]", "tap[atex]"

      assert_select "input[name=?]", "tap[other_special_requirements]"

      assert_select "input[name=?]", "tap[other_controls]"

      assert_select "input[name=?]", "tap[other]"
    end
  end
end
