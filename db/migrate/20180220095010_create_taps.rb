class CreateTaps < ActiveRecord::Migration[5.2]
  def change
    create_table :taps do |t|
      t.string :name
      t.string :rfid_number
      t.integer :serial_number
      t.integer :number_customer_tag
      t.date :manufacturing_date
      t.string :sales_number
      t.string :customer_order_number
      t.string :article_number
      t.references :industrial_unit, foreign_key: true
      t.string :dn
      t.string :input_connection
      t.string :output_connection
      t.string :double_jacket_connection
      t.string :inclination_input_offset_output
      t.string :face_to_face
      t.float :maximal_pressure
      t.float :test_pressure
      t.float :maximum_temperature
      t.float :pressure_at_maximum_temperature
      t.float :minimum_temperature
      t.float :pressure_at_minimum_temperature
      t.string :fluid_name
      t.float :pressure
      t.float :temperature
      t.integer :fluid_nature
      t.integer :fluid_danger_group
      t.boolean :unstable_gas
      t.integer :risk_category_according_to_DESP_2014_68
      t.string :manual_control
      t.string :actuator
      t.float :pneumatic_actuator_pressure
      t.string :position_detector
      t.string :open_position
      t.string :close_position
      t.string :piloting
      t.string :other_instrumentation
      t.string :shell
      t.string :double_shell
      t.string :shutter_cover
      t.string :seat
      t.string :cable_gland_packing
      t.string :seals
      t.boolean :material_certificates_required
      t.string :atex
      t.string :other_special_requirements
      t.string :other_controls
      t.string :other

      t.timestamps
    end
  end
end
