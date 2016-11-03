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

ActiveRecord::Schema.define(version: 20161102225326) do

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discussions", force: :cascade do |t|
    t.integer "number"
    t.string  "time"
    t.integer "capacity"
    t.integer "seats_open"
  end

  create_table "teams", force: :cascade do |t|
    t.boolean "approved"
    t.string  "passcode"
<<<<<<< HEAD
=======
    t.boolean "submitted"
>>>>>>> cfe42ee8a2018ee39ecc8767908e3d27a6ccb329
    t.integer "discussion_id"
  end

  add_index "teams", ["discussion_id"], name: "index_teams_on_discussion_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "team"
    t.string   "major"
    t.string   "sid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "team_id"
  end

  add_index "users", ["team_id"], name: "index_users_on_team_id"

end
