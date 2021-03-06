# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160126191304) do

  create_table "bookings", force: :cascade do |t|
    t.integer  "number_of_people"
    t.integer  "total_price"
    t.integer  "centre_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "service_id"
    t.integer  "rider_id"
    t.boolean  "validation",       default: false
    t.boolean  "payed",            default: false
  end

  add_index "bookings", ["centre_id"], name: "index_bookings_on_centre_id"
  add_index "bookings", ["rider_id"], name: "index_bookings_on_rider_id"
  add_index "bookings", ["service_id"], name: "index_bookings_on_service_id"

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "centres", force: :cascade do |t|
    t.integer  "siret"
    t.string   "ffe"
    t.string   "name"
    t.integer  "user_id"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "phone"
    t.string   "picture1"
    t.string   "picture2"
    t.string   "picture3"
    t.string   "picture4"
  end

  add_index "centres", ["user_id"], name: "index_centres_on_user_id"

  create_table "riders", force: :cascade do |t|
    t.integer  "age"
    t.string   "gender"
    t.integer  "weight"
    t.integer  "tall"
    t.string   "nickname"
    t.string   "level"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "phone"
    t.string   "address"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "avatar"
  end

  add_index "riders", ["user_id"], name: "index_riders_on_user_id"

  create_table "services", force: :cascade do |t|
    t.string   "title"
    t.integer  "price"
    t.string   "description"
    t.datetime "date"
    t.datetime "time"
    t.integer  "number_of_people"
    t.integer  "centre_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "category_id"
    t.string   "image1"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
  end

  add_index "services", ["category_id"], name: "index_services_on_category_id"
  add_index "services", ["centre_id"], name: "index_services_on_centre_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.boolean  "is_centre",              default: false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["provider"], name: "index_users_on_provider"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid"], name: "index_users_on_uid"

end
