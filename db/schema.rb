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

ActiveRecord::Schema[7.1].define(version: 2024_05_02_221629) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agenda_items", force: :cascade do |t|
    t.text "subject"
    t.text "details"
    t.boolean "done"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "plc_meeting_id", null: false
    t.text "resolutions"
    t.index ["plc_meeting_id"], name: "index_agenda_items_on_plc_meeting_id"
  end

  create_table "committee_agenda_items", force: :cascade do |t|
    t.text "subject"
    t.text "details"
    t.boolean "done"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "committee_meeting_id", null: false
    t.text "resolutions"
    t.index ["committee_meeting_id"], name: "index_committee_agenda_items_on_committee_meeting_id"
  end

  create_table "committee_meetings", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plc_meetings", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sign_ups", force: :cascade do |t|
    t.text "first_name"
    t.text "last_name"
    t.boolean "paided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "troop_event_id", null: false
    t.index ["troop_event_id"], name: "index_sign_ups_on_troop_event_id"
  end

  create_table "troop_events", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.time "start_time"
    t.time "end_time"
    t.text "title"
    t.text "location"
    t.float "cost"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "agenda_items", "plc_meetings"
  add_foreign_key "committee_agenda_items", "committee_meetings"
  add_foreign_key "sign_ups", "troop_events"
  add_foreign_key "users", "roles"
end
