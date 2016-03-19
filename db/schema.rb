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

ActiveRecord::Schema.define(version: 20160319004423) do

  create_table "day_entries", force: :cascade do |t|
    t.float    "weight"
    t.float    "bodyfat"
    t.float    "bmi"
    t.integer  "minutes_of_sleep"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.date     "entry_date"
  end

  create_table "journals", force: :cascade do |t|
    t.integer  "current_day_entry_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "current_night_entry_id"
  end

  create_table "night_entries", force: :cascade do |t|
    t.float    "weight"
    t.float    "bodyfat"
    t.float    "bmi"
    t.integer  "calories_burned"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.date     "entry_date"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
