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

ActiveRecord::Schema.define(version: 20170726215923) do

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "superadmin"
  end

  create_table "discussions", force: :cascade do |t|
    t.integer "number"
    t.string  "time"
    t.integer "capacity"
    t.integer "submission_id"
    t.string  "day"
  end

  add_index "discussions", ["submission_id"], name: "index_discussions_on_submission_id"

  create_table "options", force: :cascade do |t|
    t.integer "minimum_team_size"
    t.integer "maximum_team_size"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "user_id"
    t.string  "target_type"
    t.integer "target_id"
  end

  create_table "submissions", force: :cascade do |t|
    t.integer  "disc1id"
    t.integer  "disc2id"
    t.integer  "disc3id"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.boolean  "approved"
    t.string   "passcode"
    t.integer  "submission_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.boolean  "submitted"
    t.integer  "discussion_id"
    t.string   "declared"
    t.integer  "pending_requests"
    t.integer  "users_count"
  end

  add_index "teams", ["discussion_id"], name: "index_teams_on_discussion_id"

  create_table "users", force: :cascade do |t|
    t.string   "name",                null: false
    t.string   "email",               null: false
    t.string   "major",               null: false
    t.string   "sid",                 null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "team_id"
    t.string   "bio"
    t.integer  "time_commitment"
    t.string   "experience"
    t.string   "facebook"
    t.string   "linkedin"
    t.boolean  "waitlisted"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["team_id"], name: "index_users_on_team_id"

end
