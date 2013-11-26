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

ActiveRecord::Schema.define(version: 20131126163131) do

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

  create_table "ratings", force: true do |t|
    t.integer  "activity_id"
    t.integer  "user_id"
    t.integer  "score",       default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["activity_id"], name: "index_ratings_on_activity_id"
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id"

  create_table "reviews", force: true do |t|
    t.integer  "user_id"
    t.integer  "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "review_text"
  end

  add_index "reviews", ["activity_id"], name: "index_reviews_on_activity_id"
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

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

end
