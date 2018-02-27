require 'rails_helper'

RSpec.describe "tap_templates/index", type: :view do
  before(:each) do
    assign(:tap_templates, [
      TapTemplate.create!(
        :name => "Name",
        :article_number => "Article Number",
        :dn => "Dn",
        :input_connection => "Input Connection",
        :output_connection => "Output Connection",
        :double_jacket_connection => "Double Jacket Connection",
        :inclination_input_offset_output => "Inclination Input Offset Output",
        :face_to_face => "Face To Face",
        :maximal_pressure => 2.5,
        :test_pressure => 3.5,
        :maximum_temperature => 4.5,
        :pressure_at_maximum_temperature => 5.5,
        :minimum_temperature => 6.5,
        :pressure_at_minimum_temperature => 7.5,
        :fluid_nature => 8,
        :fluid_danger_group => 9,
        :unstable_gas => false,
        :risk_category => 10,
        :manual_control => "Manual Control",
        :actuator => "Actuator",
        :pneumatic_actuator_pressure => 11.5,
        :position_detector => "Position Detector",
        :open_position => "Open Position",
        :close_position => "Close Position",
        :piloting => "Piloting",
        :other_instrumentation => "Other Instrumentation",
        :shell => "Shell",
        :double_shell => "Double Shell",
        :shutter_cover => "Shutter Cover",
        :seat => "Seat",
        :cable_gland_packing => "Cable Gland Packing",
        :seals => "Seals",
        :atex => "Atex",
        :other_special_requirements => "Other Special Requirements",
        :other_controls => "Other Controls",
        :other => "Other"
      ),
      TapTemplate.create!(
        :name => "Name",
        :article_number => "Article Number",
        :dn => "Dn",
        :input_connection => "Input Connection",
        :output_connection => "Output Connection",
        :double_jacket_connection => "Double Jacket Connection",
        :inclination_input_offset_output => "Inclination Input Offset Output",
        :face_to_face => "Face To Face",
        :maximal_pressure => 2.5,
        :test_pressure => 3.5,
        :maximum_temperature => 4.5,
        :pressure_at_maximum_temperature => 5.5,
        :minimum_temperature => 6.5,
        :pressure_at_minimum_temperature => 7.5,
        :fluid_nature => 8,
        :fluid_danger_group => 9,
        :unstable_gas => false,
        :risk_category => 10,
        :manual_control => "Manual Control",
        :actuator => "Actuator",
        :pneumatic_actuator_pressure => 11.5,
        :position_detector => "Position Detector",
        :open_position => "Open Position",
        :close_position => "Close Position",
        :piloting => "Piloting",
        :other_instrumentation => "Other Instrumentation",
        :shell => "Shell",
        :double_shell => "Double Shell",
        :shutter_cover => "Shutter Cover",
        :seat => "Seat",
        :cable_gland_packing => "Cable Gland Packing",
        :seals => "Seals",
        :atex => "Atex",
        :other_special_requirements => "Other Special Requirements",
        :other_controls => "Other Controls",
        :other => "Other"
      )
    ])
  end

  it "renders a list of tap_templates" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Article Number".to_s, :count => 2
    assert_select "tr>td", :text => "Dn".to_s, :count => 2
    assert_select "tr>td", :text => "Input Connection".to_s, :count => 2
    assert_select "tr>td", :text => "Output Connection".to_s, :count => 2
    assert_select "tr>td", :text => "Double Jacket Connection".to_s, :count => 2
    assert_select "tr>td", :text => "Inclination Input Offset Output".to_s, :count => 2
    assert_select "tr>td", :text => "Face To Face".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => 4.5.to_s, :count => 2
    assert_select "tr>td", :text => 5.5.to_s, :count => 2
    assert_select "tr>td", :text => 6.5.to_s, :count => 2
    assert_select "tr>td", :text => 7.5.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 10.to_s, :count => 2
    assert_select "tr>td", :text => "Manual Control".to_s, :count => 2
    assert_select "tr>td", :text => "Actuator".to_s, :count => 2
    assert_select "tr>td", :text => 11.5.to_s, :count => 2
    assert_select "tr>td", :text => "Position Detector".to_s, :count => 2
    assert_select "tr>td", :text => "Open Position".to_s, :count => 2
    assert_select "tr>td", :text => "Close Position".to_s, :count => 2
    assert_select "tr>td", :text => "Piloting".to_s, :count => 2
    assert_select "tr>td", :text => "Other Instrumentation".to_s, :count => 2
    assert_select "tr>td", :text => "Shell".to_s, :count => 2
    assert_select "tr>td", :text => "Double Shell".to_s, :count => 2
    assert_select "tr>td", :text => "Shutter Cover".to_s, :count => 2
    assert_select "tr>td", :text => "Seat".to_s, :count => 2
    assert_select "tr>td", :text => "Cable Gland Packing".to_s, :count => 2
    assert_select "tr>td", :text => "Seals".to_s, :count => 2
    assert_select "tr>td", :text => "Atex".to_s, :count => 2
    assert_select "tr>td", :text => "Other Special Requirements".to_s, :count => 2
    assert_select "tr>td", :text => "Other Controls".to_s, :count => 2
    assert_select "tr>td", :text => "Other".to_s, :count => 2
  end
end
