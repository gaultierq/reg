# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_02_20_095010) do

  create_table "industrial_units", force: :cascade do |t|
    t.string "name"
    t.string "address", null: false
    t.string "postcode", null: false
    t.string "city", null: false
    t.string "country", null: false
    t.float "latitude"
    t.float "longitude"
    t.text "additional_information"
    t.text "process_information"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tap_templates", force: :cascade do |t|
    t.string "name"
    t.string "article_number"
    t.string "dn"
    t.string "input_connection"
    t.string "output_connection"
    t.string "double_jacket_connection"
    t.string "inclination_input_offset_output"
    t.string "face_to_face"
    t.float "maximal_pressure"
    t.float "test_pressure"
    t.float "maximum_temperature"
    t.float "pressure_at_maximum_temperature"
    t.float "minimum_temperature"
    t.float "pressure_at_minimum_temperature"
    t.integer "fluid_nature"
    t.integer "fluid_danger_group"
    t.boolean "unstable_gas"
    t.integer "risk_category"
    t.string "manual_control"
    t.string "actuator"
    t.float "pneumatic_actuator_pressure"
    t.string "position_detector"
    t.string "open_position"
    t.string "close_position"
    t.string "piloting"
    t.string "other_instrumentation"
    t.string "shell"
    t.string "double_shell"
    t.string "shutter_cover"
    t.string "seat"
    t.string "cable_gland_packing"
    t.string "seals"
    t.string "atex"
    t.string "other_special_requirements"
    t.string "other_controls"
    t.string "other"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taps", force: :cascade do |t|
    t.string "name"
    t.string "rfid_number"
    t.integer "serial_number"
    t.integer "number_customer_tag"
    t.date "manufacturing_date"
    t.string "sales_number"
    t.string "customer_order_number"
    t.string "article_number"
    t.integer "industrial_unit_id"
    t.string "dn"
    t.string "input_connection"
    t.string "output_connection"
    t.string "double_jacket_connection"
    t.string "inclination_input_offset_output"
    t.string "face_to_face"
    t.float "maximal_pressure"
    t.float "test_pressure"
    t.float "maximum_temperature"
    t.float "pressure_at_maximum_temperature"
    t.float "minimum_temperature"
    t.float "pressure_at_minimum_temperature"
    t.string "fluid_name"
    t.float "pressure"
    t.float "temperature"
    t.integer "fluid_nature"
    t.integer "fluid_danger_group"
    t.boolean "unstable_gas"
    t.integer "risk_category"
    t.string "manual_control"
    t.string "actuator"
    t.float "pneumatic_actuator_pressure"
    t.string "position_detector"
    t.string "open_position"
    t.string "close_position"
    t.string "piloting"
    t.string "other_instrumentation"
    t.string "shell"
    t.string "double_shell"
    t.string "shutter_cover"
    t.string "seat"
    t.string "cable_gland_packing"
    t.string "seals"
    t.boolean "material_certificates_required"
    t.string "atex"
    t.string "other_special_requirements"
    t.string "other_controls"
    t.string "other"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["industrial_unit_id"], name: "index_taps_on_industrial_unit_id"
  end

end
