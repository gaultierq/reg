require 'rails_helper'

RSpec.describe "tap_templates/edit", type: :view do
  before(:each) do
    @tap_template = assign(:tap_template, TapTemplate.create!(
      :name => "MyString",
      :article_number => "MyString",
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
      :atex => "MyString",
      :other_special_requirements => "MyString",
      :other_controls => "MyString",
      :other => "MyString"
    ))
  end

  it "renders the edit tap_template form" do
    render

    assert_select "form[action=?][method=?]", tap_template_path(@tap_template), "post" do

      assert_select "input[name=?]", "tap_template[name]"

      assert_select "input[name=?]", "tap_template[article_number]"

      assert_select "input[name=?]", "tap_template[dn]"

      assert_select "input[name=?]", "tap_template[input_connection]"

      assert_select "input[name=?]", "tap_template[output_connection]"

      assert_select "input[name=?]", "tap_template[double_jacket_connection]"

      assert_select "input[name=?]", "tap_template[inclination_input_offset_output]"

      assert_select "input[name=?]", "tap_template[face_to_face]"

      assert_select "input[name=?]", "tap_template[maximal_pressure]"

      assert_select "input[name=?]", "tap_template[test_pressure]"

      assert_select "input[name=?]", "tap_template[maximum_temperature]"

      assert_select "input[name=?]", "tap_template[pressure_at_maximum_temperature]"

      assert_select "input[name=?]", "tap_template[minimum_temperature]"

      assert_select "input[name=?]", "tap_template[pressure_at_minimum_temperature]"

      assert_select "input[name=?]", "tap_template[fluid_nature]"

      assert_select "input[name=?]", "tap_template[fluid_danger_group]"

      assert_select "input[name=?]", "tap_template[unstable_gas]"

      assert_select "input[name=?]", "tap_template[risk_category]"

      assert_select "input[name=?]", "tap_template[manual_control]"

      assert_select "input[name=?]", "tap_template[actuator]"

      assert_select "input[name=?]", "tap_template[pneumatic_actuator_pressure]"

      assert_select "input[name=?]", "tap_template[position_detector]"

      assert_select "input[name=?]", "tap_template[open_position]"

      assert_select "input[name=?]", "tap_template[close_position]"

      assert_select "input[name=?]", "tap_template[piloting]"

      assert_select "input[name=?]", "tap_template[other_instrumentation]"

      assert_select "input[name=?]", "tap_template[shell]"

      assert_select "input[name=?]", "tap_template[double_shell]"

      assert_select "input[name=?]", "tap_template[shutter_cover]"

      assert_select "input[name=?]", "tap_template[seat]"

      assert_select "input[name=?]", "tap_template[cable_gland_packing]"

      assert_select "input[name=?]", "tap_template[seals]"

      assert_select "input[name=?]", "tap_template[atex]"

      assert_select "input[name=?]", "tap_template[other_special_requirements]"

      assert_select "input[name=?]", "tap_template[other_controls]"

      assert_select "input[name=?]", "tap_template[other]"
    end
  end
end
