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

ActiveRecord::Schema.define(version: 20140404151234) do

  create_table "current_users", force: true do |t|
    t.string   "user_name"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.string   "first_name"
    t.string   "middle_initial"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "is_admin",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "request_offs", force: true do |t|
    t.integer  "employee_id"
    t.date     "requested_date"
    t.string   "comment"
    t.string   "admin_comment"
    t.string   "request_response", default: "Pending"
    t.string   "vacation_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
