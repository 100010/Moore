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

ActiveRecord::Schema.define(version: 20160813171036) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.integer  "lecture_id", null: false
    t.date     "due_date",   null: false
    t.string   "title",      null: false
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "assignments", ["lecture_id"], name: "index_assignments_on_lecture_id", using: :btree

  create_table "bootsy_image_galleries", force: :cascade do |t|
    t.integer  "bootsy_resource_id"
    t.string   "bootsy_resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", force: :cascade do |t|
    t.string   "image_file"
    t.integer  "image_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text    "content", null: false
    t.string  "image"
  end

  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "lecture_share_groups", force: :cascade do |t|
    t.integer "share_group_id", null: false
    t.integer "lecture_id",     null: false
  end

  create_table "lectures", force: :cascade do |t|
    t.string   "title",                                      null: false
    t.string   "professor_name",                             null: false
    t.integer  "weekday",                                    null: false
    t.integer  "unit_count",                                 null: false
    t.integer  "period",                                     null: false
    t.boolean  "is_required_for_graduation?", default: true, null: false
    t.integer  "lecture_category",                           null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "lectures", ["professor_name"], name: "index_lectures_on_professor_name", using: :btree

  create_table "share_group_users", force: :cascade do |t|
    t.integer "user_id",        null: false
    t.integer "share_group_id", null: false
  end

  add_index "share_group_users", ["share_group_id"], name: "index_share_group_users_on_share_group_id", using: :btree
  add_index "share_group_users", ["user_id"], name: "index_share_group_users_on_user_id", using: :btree

  create_table "share_groups", force: :cascade do |t|
    t.string   "group_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.boolean  "admin",           default: false, null: false
    t.string   "user_name",                       null: false
    t.string   "email",                           null: false
    t.integer  "gender",                          null: false
    t.integer  "undergraduate",                   null: false
    t.integer  "department",                      null: false
    t.string   "password_digest",                 null: false
    t.string   "remember_digest"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_foreign_key "assignments", "lectures", on_delete: :cascade
end
