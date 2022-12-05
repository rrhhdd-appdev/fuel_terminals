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
    t.boolean "status"
    t.string "county"
    t.float "latitude"
    t.float "longitude"
    t.string "source"
    t.string "website"
    t.string "owner"
    t.string "operator"
    t.string "commodity"
    t.integer "capacity"
    t.boolean "truck_in"
    t.boolean "truck_out"
    t.boolean "pipe_in"
    t.boolean "pipe_out"
    t.boolean "marine_in"
    t.boolean "marin_out"
    t.boolean "rail_in"
    t.boolean "rail_out"
    t.string "parsel"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "zip4"
    t.integer "tanks_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fuels", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.integer "tanks_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tanks", force: :cascade do |t|
    t.integer "terminal_id"
    t.integer "fuel_id"
    t.integer "product_capacity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "terminal_notes", force: :cascade do |t|
    t.text "note"
    t.integer "user_id"
    t.integer "terminal_id"
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
