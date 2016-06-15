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

ActiveRecord::Schema.define(version: 20160615135258) do

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
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "colleges", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "user_name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

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
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

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
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "requests", force: :cascade do |t|
    t.string   "topic"
    t.text     "description"
    t.integer  "college_id"
    t.integer  "subject_id"
    t.string   "subject"
    t.string   "college"
    t.integer  "user_id"
    t.string   "user_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "user_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
