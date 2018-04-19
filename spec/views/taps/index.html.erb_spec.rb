require 'rails_helper'

RSpec.describe "faucets/index", type: :view do
  before(:each) do
    assign(:faucets, [
        Faucet.create!(
        :name => "Name",
        :rfid_number => "Rfid Number",
        :serial_number => 2,
        :number_customer_tag => 3,
        :sales_number => "Sales Number",
        :customer_order_number => "Customer Order Number",
        :article_number => "Article Number",
        :industrial_unit => nil,
        :dn => "Dn",
        :input_connection => "Input Connection",
        :output_connection => "Output Connection",
        :double_jacket_connection => "Double Jacket Connection",
        :inclination_input_offset_output => "Inclination Input Offset Output",
        :face_to_face => "Face To Face",
        :maximal_pressure => 4.5,
        :test_pressure => 5.5,
        :maximum_temperature => 6.5,
        :pressure_at_maximum_temperature => 7.5,
        :minimum_temperature => 8.5,
        :pressure_at_minimum_temperature => 9.5,
        :fluid_name => "Fluid Name",
        :pressure => 10.5,
        :temperature => 11.5,
        :fluid_nature => 12,
        :fluid_danger_group => 13,
        :unstable_gas => false,
        :risk_category => 14,
        :manual_control => "Manual Control",
        :actuator => "Actuator",
        :pneumatic_actuator_pressure => 15.5,
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
        :material_certificates_required => false,
        :atex => "Atex",
        :other_special_requirements => "Other Special Requirements",
        :other_controls => "Other Controls",
        :other => "Other"
      ),
        Faucet.create!(
        :name => "Name",
        :rfid_number => "Rfid Number",
        :serial_number => 2,
        :number_customer_tag => 3,
        :sales_number => "Sales Number",
        :customer_order_number => "Customer Order Number",
        :article_number => "Article Number",
        :industrial_unit => nil,
        :dn => "Dn",
        :input_connection => "Input Connection",
        :output_connection => "Output Connection",
        :double_jacket_connection => "Double Jacket Connection",
        :inclination_input_offset_output => "Inclination Input Offset Output",
        :face_to_face => "Face To Face",
        :maximal_pressure => 4.5,
        :test_pressure => 5.5,
        :maximum_temperature => 6.5,
        :pressure_at_maximum_temperature => 7.5,
        :minimum_temperature => 8.5,
        :pressure_at_minimum_temperature => 9.5,
        :fluid_name => "Fluid Name",
        :pressure => 10.5,
        :temperature => 11.5,
        :fluid_nature => 12,
        :fluid_danger_group => 13,
        :unstable_gas => false,
        :risk_category => 14,
        :manual_control => "Manual Control",
        :actuator => "Actuator",
        :pneumatic_actuator_pressure => 15.5,
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
        :material_certificates_required => false,
        :atex => "Atex",
        :other_special_requirements => "Other Special Requirements",
        :other_controls => "Other Controls",
        :other => "Other"
      )
    ])
  end

  it "renders a list of faucets" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Rfid Number".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Sales Number".to_s, :count => 2
    assert_select "tr>td", :text => "Customer Order Number".to_s, :count => 2
    assert_select "tr>td", :text => "Article Number".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Dn".to_s, :count => 2
    assert_select "tr>td", :text => "Input Connection".to_s, :count => 2
    assert_select "tr>td", :text => "Output Connection".to_s, :count => 2
    assert_select "tr>td", :text => "Double Jacket Connection".to_s, :count => 2
    assert_select "tr>td", :text => "Inclination Input Offset Output".to_s, :count => 2
    assert_select "tr>td", :text => "Face To Face".to_s, :count => 2
    assert_select "tr>td", :text => 4.5.to_s, :count => 2
    assert_select "tr>td", :text => 5.5.to_s, :count => 2
    assert_select "tr>td", :text => 6.5.to_s, :count => 2
    assert_select "tr>td", :text => 7.5.to_s, :count => 2
    assert_select "tr>td", :text => 8.5.to_s, :count => 2
    assert_select "tr>td", :text => 9.5.to_s, :count => 2
    assert_select "tr>td", :text => "Fluid Name".to_s, :count => 2
    assert_select "tr>td", :text => 10.5.to_s, :count => 2
    assert_select "tr>td", :text => 11.5.to_s, :count => 2
    assert_select "tr>td", :text => 12.to_s, :count => 2
    assert_select "tr>td", :text => 13.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 14.to_s, :count => 2
    assert_select "tr>td", :text => "Manual Control".to_s, :count => 2
    assert_select "tr>td", :text => "Actuator".to_s, :count => 2
    assert_select "tr>td", :text => 15.5.to_s, :count => 2
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
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Atex".to_s, :count => 2
    assert_select "tr>td", :text => "Other Special Requirements".to_s, :count => 2
    assert_select "tr>td", :text => "Other Controls".to_s, :count => 2
    assert_select "tr>td", :text => "Other".to_s, :count => 2
  end
end
