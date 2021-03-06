# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_04_193148) do

  create_table "properties", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "rooms"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "bathrooms"
    t.boolean "pets"
    t.boolean "parking_slot"
    t.decimal "daily_rate"
    t.integer "property_type_id", null: false
    t.integer "region_id", null: false
    t.integer "property_owner_id", null: false
    t.index ["property_owner_id"], name: "index_properties_on_property_owner_id"
    t.index ["property_type_id"], name: "index_properties_on_property_type_id"
    t.index ["region_id"], name: "index_properties_on_region_id"
  end

  create_table "property_owners", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_property_owners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_property_owners_on_reset_password_token", unique: true
  end

  create_table "property_types", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
  end

  create_table "regions", force: :cascade do |t|
    t.string "property_location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "properties", "property_owners"
  add_foreign_key "properties", "property_types"
  add_foreign_key "properties", "regions"
end
