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

ActiveRecord::Schema.define(version: 20150715101833) do

  create_table "areas", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "areas_railroad_companies", force: :cascade do |t|
    t.integer  "area_id",             limit: 4
    t.integer  "railroad_company_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "areas_railroad_companies", ["area_id"], name: "index_areas_railroad_companies_on_area_id", using: :btree
  add_index "areas_railroad_companies", ["railroad_company_id"], name: "index_areas_railroad_companies_on_railroad_company_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name",          limit: 255,               null: false
    t.integer  "prefecture_id", limit: 4
    t.float    "longitude",     limit: 24,  default: 0.0
    t.float    "latitude",      limit: 24,  default: 0.0
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "cities", ["prefecture_id"], name: "index_cities_on_prefecture_id", using: :btree

  create_table "prefectures", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "area_id",    limit: 4
  end

  add_index "prefectures", ["area_id"], name: "index_prefectures_on_area_id", using: :btree

  create_table "railroad_companies", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "railroads", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "state",               limit: 255
    t.string   "state_detail",        limit: 255
    t.integer  "status",              limit: 4,   default: 0
    t.integer  "railroad_company_id", limit: 4
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "railroads", ["railroad_company_id"], name: "index_railroads_on_railroad_company_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "uuid",        limit: 255, null: false
    t.integer  "railroad_id", limit: 4
    t.integer  "city_id",     limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "users", ["city_id"], name: "index_users_on_city_id", using: :btree
  add_index "users", ["railroad_id"], name: "index_users_on_railroad_id", using: :btree

  create_table "weathers", force: :cascade do |t|
    t.string   "weather",       limit: 255
    t.string   "description",   limit: 255
    t.float    "temp",          limit: 24,  default: 0.0, null: false
    t.float    "temp_min",      limit: 24,  default: 0.0, null: false
    t.float    "temp_max",      limit: 24,  default: 0.0, null: false
    t.integer  "pressure",      limit: 4,   default: 0,   null: false
    t.integer  "humidity",      limit: 4,   default: 0,   null: false
    t.float    "wind_speed",    limit: 24,  default: 0.0, null: false
    t.integer  "wind_deg",      limit: 4,   default: 0,   null: false
    t.float    "rain_volume",   limit: 24,  default: 0.0, null: false
    t.integer  "rain_hour",     limit: 4,   default: 0,   null: false
    t.float    "snow_volume",   limit: 24,  default: 0.0, null: false
    t.integer  "snow_hour",     limit: 4,   default: 0,   null: false
    t.integer  "cloudiness",    limit: 4,   default: 0,   null: false
    t.datetime "calculated_at"
    t.integer  "city_id",       limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "weathers", ["city_id"], name: "index_weathers_on_city_id", using: :btree

  add_foreign_key "prefectures", "areas"
  add_foreign_key "users", "cities"
  add_foreign_key "users", "railroads"
end
