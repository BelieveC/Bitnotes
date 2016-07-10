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

ActiveRecord::Schema.define(version: 20160710025846) do

  create_table "aimages", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "assignment_id"
  end

  add_index "aimages", ["assignment_id"], name: "index_aimages_on_assignment_id"

  create_table "assignments", force: :cascade do |t|
    t.string   "topic"
    t.text     "description"
    t.integer  "college_id"
    t.integer  "subject_id"
    t.string   "subject"
    t.string   "college"
    t.integer  "user_id"
    t.string   "user_name"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "cached_votes_total", default: 0
    t.integer  "cached_votes_score", default: 0
    t.integer  "cached_votes_up",    default: 0
    t.integer  "cached_votes_down",  default: 0
  end

  add_index "assignments", ["cached_votes_down"], name: "index_assignments_on_cached_votes_down"
  add_index "assignments", ["cached_votes_score"], name: "index_assignments_on_cached_votes_score"
  add_index "assignments", ["cached_votes_total"], name: "index_assignments_on_cached_votes_total"
  add_index "assignments", ["cached_votes_up"], name: "index_assignments_on_cached_votes_up"

  create_table "cimages", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "college_id"
  end

  add_index "cimages", ["college_id"], name: "index_cimages_on_college_id"

  create_table "colleges", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "user_name"
    t.integer  "user_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "cached_votes_total", default: 0
    t.integer  "cached_votes_score", default: 0
    t.integer  "cached_votes_up",    default: 0
    t.integer  "cached_votes_down",  default: 0
  end

  add_index "colleges", ["cached_votes_down"], name: "index_colleges_on_cached_votes_down"
  add_index "colleges", ["cached_votes_score"], name: "index_colleges_on_cached_votes_score"
  add_index "colleges", ["cached_votes_total"], name: "index_colleges_on_cached_votes_total"
  add_index "colleges", ["cached_votes_up"], name: "index_colleges_on_cached_votes_up"

  create_table "eimages", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "examnote_id"
  end

  add_index "eimages", ["examnote_id"], name: "index_eimages_on_examnote_id"

  create_table "examnotes", force: :cascade do |t|
    t.string   "topic"
    t.text     "description"
    t.integer  "college_id"
    t.integer  "subject_id"
    t.string   "subject"
    t.string   "college"
    t.integer  "user_id"
    t.string   "user_name"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "cached_votes_total", default: 0
    t.integer  "cached_votes_score", default: 0
    t.integer  "cached_votes_up",    default: 0
    t.integer  "cached_votes_down",  default: 0
  end

  add_index "examnotes", ["cached_votes_down"], name: "index_examnotes_on_cached_votes_down"
  add_index "examnotes", ["cached_votes_score"], name: "index_examnotes_on_cached_votes_score"
  add_index "examnotes", ["cached_votes_total"], name: "index_examnotes_on_cached_votes_total"
  add_index "examnotes", ["cached_votes_up"], name: "index_examnotes_on_cached_votes_up"

  create_table "impressions", force: :cascade do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index"
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id"

  create_table "pimages", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "practical_id"
  end

  add_index "pimages", ["practical_id"], name: "index_pimages_on_practical_id"

  create_table "practicals", force: :cascade do |t|
    t.string   "title"
    t.string   "aim"
    t.integer  "subject_id"
    t.integer  "college_id"
    t.text     "description"
    t.string   "user_name"
    t.integer  "user_id"
    t.string   "subject"
    t.string   "college"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "cached_votes_total", default: 0
    t.integer  "cached_votes_score", default: 0
    t.integer  "cached_votes_up",    default: 0
    t.integer  "cached_votes_down",  default: 0
  end

  add_index "practicals", ["cached_votes_down"], name: "index_practicals_on_cached_votes_down"
  add_index "practicals", ["cached_votes_score"], name: "index_practicals_on_cached_votes_score"
  add_index "practicals", ["cached_votes_total"], name: "index_practicals_on_cached_votes_total"
  add_index "practicals", ["cached_votes_up"], name: "index_practicals_on_cached_votes_up"
  add_index "practicals", ["user_id"], name: "index_practicals_on_user_id"

  create_table "qimages", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "qpaper_id"
  end

  add_index "qimages", ["qpaper_id"], name: "index_qimages_on_qpaper_id"

  create_table "qpapers", force: :cascade do |t|
    t.string   "examname"
    t.date     "date"
    t.text     "description"
    t.integer  "college_id"
    t.integer  "subject_id"
    t.string   "subject"
    t.string   "college"
    t.integer  "user_id"
    t.string   "user_name"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "cached_votes_total", default: 0
    t.integer  "cached_votes_score", default: 0
    t.integer  "cached_votes_up",    default: 0
    t.integer  "cached_votes_down",  default: 0
  end

  add_index "qpapers", ["cached_votes_down"], name: "index_qpapers_on_cached_votes_down"
  add_index "qpapers", ["cached_votes_score"], name: "index_qpapers_on_cached_votes_score"
  add_index "qpapers", ["cached_votes_total"], name: "index_qpapers_on_cached_votes_total"
  add_index "qpapers", ["cached_votes_up"], name: "index_qpapers_on_cached_votes_up"

  create_table "requests", force: :cascade do |t|
    t.string   "topic"
    t.text     "description"
    t.integer  "college_id"
    t.integer  "subject_id"
    t.string   "subject"
    t.string   "college"
    t.integer  "user_id"
    t.string   "user_name"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "cached_votes_total", default: 0
    t.integer  "cached_votes_score", default: 0
    t.integer  "cached_votes_up",    default: 0
    t.integer  "cached_votes_down",  default: 0
  end

  add_index "requests", ["cached_votes_down"], name: "index_requests_on_cached_votes_down"
  add_index "requests", ["cached_votes_score"], name: "index_requests_on_cached_votes_score"
  add_index "requests", ["cached_votes_total"], name: "index_requests_on_cached_votes_total"
  add_index "requests", ["cached_votes_up"], name: "index_requests_on_cached_votes_up"

  create_table "simages", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "subject_id"
  end

  add_index "simages", ["subject_id"], name: "index_simages_on_subject_id"

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "user_name"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "cached_votes_total", default: 0
    t.integer  "cached_votes_score", default: 0
    t.integer  "cached_votes_up",    default: 0
    t.integer  "cached_votes_down",  default: 0
  end

  add_index "subjects", ["cached_votes_down"], name: "index_subjects_on_cached_votes_down"
  add_index "subjects", ["cached_votes_score"], name: "index_subjects_on_cached_votes_score"
  add_index "subjects", ["cached_votes_total"], name: "index_subjects_on_cached_votes_total"
  add_index "subjects", ["cached_votes_up"], name: "index_subjects_on_cached_votes_up"

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.text     "description"
    t.string   "phname"
    t.text     "intro"
    t.string   "fblink"
    t.string   "twitterlink"
    t.string   "pinterestlink"
  end

  create_table "votes", force: :cascade do |t|
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
