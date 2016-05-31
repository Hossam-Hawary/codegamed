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

ActiveRecord::Schema.define(version: 20160531130526) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "badges", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "image_url",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "levels", force: :cascade do |t|
    t.integer  "badge_id",   limit: 4
    t.integer  "order",      limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "levels", ["badge_id"], name: "index_levels_on_badge_id", using: :btree

  create_table "missions", force: :cascade do |t|
    t.integer  "order",        limit: 4
    t.integer  "score",        limit: 4
    t.integer  "level_id",     limit: 4
    t.string   "video_url",    limit: 255
    t.text     "problem",      limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.text     "initial_code", limit: 65535
  end

  add_index "missions", ["level_id"], name: "index_missions_on_level_id", using: :btree

  create_table "passed_levels", force: :cascade do |t|
    t.integer  "level_id",           limit: 4
    t.integer  "user_id",            limit: 4
    t.integer  "progress",           limit: 4
    t.integer  "last_mission_order", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "passed_levels", ["level_id"], name: "index_passed_levels_on_level_id", using: :btree
  add_index "passed_levels", ["user_id"], name: "index_passed_levels_on_user_id", using: :btree

  create_table "passed_missions", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "mission_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "passed_missions", ["mission_id"], name: "index_passed_missions_on_mission_id", using: :btree
  add_index "passed_missions", ["user_id"], name: "index_passed_missions_on_user_id", using: :btree

  create_table "test_cases", force: :cascade do |t|
    t.integer  "mission_id", limit: 4
    t.string   "input",      limit: 255
    t.string   "output",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "test_cases", ["mission_id"], name: "index_test_cases_on_mission_id", using: :btree

  create_table "user_badges", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "badge_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "user_badges", ["badge_id"], name: "index_user_badges_on_badge_id", using: :btree
  add_index "user_badges", ["user_id"], name: "index_user_badges_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider",         limit: 255
    t.string   "uid",              limit: 255
    t.string   "name",             limit: 255
    t.string   "oauth_token",      limit: 255
    t.datetime "oauth_expires_at"
    t.string   "image_url",        limit: 255
    t.string   "email",            limit: 255
    t.integer  "total_score",      limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_foreign_key "levels", "badges"
  add_foreign_key "missions", "levels"
  add_foreign_key "passed_levels", "levels"
  add_foreign_key "passed_levels", "users"
  add_foreign_key "passed_missions", "missions"
  add_foreign_key "passed_missions", "users"
  add_foreign_key "test_cases", "missions"
  add_foreign_key "user_badges", "badges"
  add_foreign_key "user_badges", "users"
end
