# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_12_05_162423) do

  create_table "companies", force: :cascade do |t|
    t.string "company_name"
    t.integer "users_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "facilities", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "term_type"
    t.string "term_id"
    t.string "status"
    t.string "county"
    t.integer "countyfips"
    t.float "latitude"
    t.float "longitude"
    t.string "source"
    t.string "website"
    t.string "owner"
    t.string "operator"
    t.string "commodity"
    t.integer "capacity"
    t.string "truck_in"
    t.string "truck_out"
    t.string "pipe_in"
    t.string "pipe_out"
    t.string "marine_in"
    t.string "marine_out"
    t.string "rail_in"
    t.string "rail_out"
    t.string "parsel"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "zip4"
    t.integer "naics_code"
    t.string "naics_desc"
    t.string "exstars_i"
    t.boolean "asphalt"
    t.boolean "chemicals"
    t.boolean "propane"
    t.boolean "butane"
    t.boolean "refined"
    t.boolean "ethanol"
    t.boolean "biodiesel"
    t.boolean "crude_oil"
    t.boolean "jetfuel"
    t.boolean "gasoline"
    t.boolean "distillate"
    t.boolean "avgas"
    t.boolean "renewable_diesel"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "terminal_notes", force: :cascade do |t|
    t.text "note"
    t.integer "user_id"
    t.integer "term_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.integer "company_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
