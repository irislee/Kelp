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

ActiveRecord::Schema.define(version: 20131125205022) do

  create_table "activities", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.text     "blurb"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "category_list"
    t.string   "neighborhood"
  end

  create_table "reviews", force: true do |t|
    t.integer  "user_id"
    t.integer  "activities_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "review_text"
  end

  add_index "reviews", ["activities_id"], name: "index_reviews_on_activities_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
