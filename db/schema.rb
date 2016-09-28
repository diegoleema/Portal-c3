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

ActiveRecord::Schema.define(version: 20160510191744) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "class_files", force: :cascade do |t|
    t.integer  "discipline_class_id"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "discipline_classes", force: :cascade do |t|
    t.string   "name"
    t.integer  "discipline_id"
    t.integer  "user_id"
    t.integer  "shift"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "discipline_classes", ["discipline_id"], name: "index_discipline_classes_on_discipline_id", using: :btree
  add_index "discipline_classes", ["user_id"], name: "index_discipline_classes_on_user_id", using: :btree

  create_table "disciplines", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.string   "link"
    t.integer  "credit"
    t.integer  "hours"
    t.integer  "semester"
    t.integer  "shift"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "disciplines_users", id: false, force: :cascade do |t|
    t.integer "discipline_id"
    t.integer "user_id"
  end

  add_index "disciplines_users", ["discipline_id"], name: "index_disciplines_users_on_discipline_id", using: :btree
  add_index "disciplines_users", ["user_id"], name: "index_disciplines_users_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "place"
    t.integer  "user_id"
    t.datetime "date"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "oportunities", force: :cascade do |t|
    t.string   "title"
    t.string   "employer"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "oportunities", ["user_id"], name: "index_oportunities_on_user_id", using: :btree

  create_table "user_profiles", force: :cascade do |t|
    t.boolean  "is_teacher"
    t.string   "phone"
    t.string   "degree"
    t.string   "lattes"
    t.string   "link"
    t.string   "role"
    t.text     "interests"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.integer  "role"
    t.integer  "user_profile_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "enrollment",             default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["enrollment"], name: "index_users_on_enrollment", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["user_profile_id"], name: "index_users_on_user_profile_id", using: :btree

  add_foreign_key "articles", "users"
  add_foreign_key "events", "users"
  add_foreign_key "oportunities", "users"
  add_foreign_key "users", "user_profiles"
end
