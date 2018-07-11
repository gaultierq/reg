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

ActiveRecord::Schema.define(version: 2018_07_11_121336) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_industrial_units", force: :cascade do |t|
    t.integer "admin_id"
    t.integer "industrial_unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_admin_industrial_units_on_admin_id"
    t.index ["industrial_unit_id"], name: "index_admin_industrial_units_on_industrial_unit_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.integer "invited_by_id"
    t.string "invited_by_type"
    t.string "first_name"
    t.string "last_name"
    t.integer "kind", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone_number"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["invitation_token"], name: "index_admins_on_invitation_token", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "attachments", force: :cascade do |t|
    t.integer "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "md5"
    t.string "name"
  end

  create_table "event_attachments", force: :cascade do |t|
    t.integer "event_id"
    t.integer "attachment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachment_id"], name: "index_event_attachments_on_attachment_id"
    t.index ["event_id"], name: "index_event_attachments_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer "faucet_id"
    t.integer "kind", default: 0, null: false
    t.text "comment"
    t.integer "admin_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_events_on_admin_id"
    t.index ["faucet_id"], name: "index_events_on_faucet_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "faucet_attachments", force: :cascade do |t|
    t.integer "faucet_id"
    t.integer "attachment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachment_id"], name: "index_faucet_attachments_on_attachment_id"
    t.index ["faucet_id"], name: "index_faucet_attachments_on_faucet_id"
  end

  create_table "faucets", force: :cascade do |t|
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
    t.index ["industrial_unit_id"], name: "index_faucets_on_industrial_unit_id"
    t.index ["serial_number"], name: "index_faucets_on_serial_number", unique: true
  end

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

  create_table "tap_template_attachments", force: :cascade do |t|
    t.integer "tap_template_id"
    t.integer "attachment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachment_id"], name: "index_tap_template_attachments_on_attachment_id"
    t.index ["tap_template_id"], name: "index_tap_template_attachments_on_tap_template_id"
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

  create_table "user_industrial_units", force: :cascade do |t|
    t.integer "user_id"
    t.integer "industrial_unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["industrial_unit_id"], name: "index_user_industrial_units_on_industrial_unit_id"
    t.index ["user_id"], name: "index_user_industrial_units_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.integer "invited_by_id"
    t.string "invited_by_type"
    t.string "first_name"
    t.string "last_name"
    t.integer "kind", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
