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

ActiveRecord::Schema.define(version: 2019_04_15_134635) do

  create_table "forms", force: :cascade do |t|
    t.text "name_child"
    t.datetime "date_of_birth"
    t.text "name_parent"
    t.text "phones_parent"
    t.text "phone_child"
    t.text "adress"
    t.string "email"
    t.text "food_allergy"
    t.text "vegan"
    t.text "psycho"
    t.text "events"
    t.text "also"
    t.text "bonus_contacts"
    t.text "friends"
    t.string "photo_child"
    t.string "photo_passport"
    t.string "photo_medical"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "author"
    t.text "notes"
    t.integer "validation"
    t.integer "payment"
    t.integer "refresh"
    t.integer "accept"
    t.string "archive", default: "f"
    t.index ["user_id"], name: "index_forms_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "author"
    t.text "theme"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "level", default: 1, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
