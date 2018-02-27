require 'rails_helper'

RSpec.describe "taps/show", type: :view do
  before(:each) do
    @tap = assign(:tap, Tap.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Rfid Number/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Sales Number/)
    expect(rendered).to match(/Customer Order Number/)
    expect(rendered).to match(/Article Number/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Dn/)
    expect(rendered).to match(/Input Connection/)
    expect(rendered).to match(/Output Connection/)
    expect(rendered).to match(/Double Jacket Connection/)
    expect(rendered).to match(/Inclination Input Offset Output/)
    expect(rendered).to match(/Face To Face/)
    expect(rendered).to match(/4.5/)
    expect(rendered).to match(/5.5/)
    expect(rendered).to match(/6.5/)
    expect(rendered).to match(/7.5/)
    expect(rendered).to match(/8.5/)
    expect(rendered).to match(/9.5/)
    expect(rendered).to match(/Fluid Name/)
    expect(rendered).to match(/10.5/)
    expect(rendered).to match(/11.5/)
    expect(rendered).to match(/12/)
    expect(rendered).to match(/13/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/14/)
    expect(rendered).to match(/Manual Control/)
    expect(rendered).to match(/Actuator/)
    expect(rendered).to match(/15.5/)
    expect(rendered).to match(/Position Detector/)
    expect(rendered).to match(/Open Position/)
    expect(rendered).to match(/Close Position/)
    expect(rendered).to match(/Piloting/)
    expect(rendered).to match(/Other Instrumentation/)
    expect(rendered).to match(/Shell/)
    expect(rendered).to match(/Double Shell/)
    expect(rendered).to match(/Shutter Cover/)
    expect(rendered).to match(/Seat/)
    expect(rendered).to match(/Cable Gland Packing/)
    expect(rendered).to match(/Seals/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Atex/)
    expect(rendered).to match(/Other Special Requirements/)
    expect(rendered).to match(/Other Controls/)
    expect(rendered).to match(/Other/)
  end
end
