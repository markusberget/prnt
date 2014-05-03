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

ActiveRecord::Schema.define(version: 20140503105330) do

  create_table "configurations", force: true do |t|
    t.integer  "price"
    t.boolean  "color"
    t.string   "size"
    t.boolean  "double_sided"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.string   "document"
    t.integer  "copies"
    t.integer  "configuration_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
  end

  add_index "jobs", ["configuration_id"], name: "index_jobs_on_configuration_id"

  create_table "printers", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.integer  "rating"
    t.integer  "configuration_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "job_id"
  end

  add_index "printers", ["configuration_id"], name: "index_printers_on_configuration_id"
  add_index "printers", ["job_id"], name: "index_printers_on_job_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "credits"
    t.integer  "printers_id"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["job_id"], name: "index_users_on_job_id"
  add_index "users", ["printers_id"], name: "index_users_on_printers_id"

end
