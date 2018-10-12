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

ActiveRecord::Schema.define(version: 2018_10_12_045621) do

  create_table "admins", force: :cascade do |t|
    t.string "personal_id", null: false
    t.string "entity", null: false
    t.integer "role", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "alerts", force: :cascade do |t|
    t.string "code", null: false
    t.time "dep_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "trip_id"
    t.index ["trip_id"], name: "index_alerts_on_trip_id"
    t.index ["user_id"], name: "index_alerts_on_user_id"
  end

  create_table "buses", force: :cascade do |t|
    t.string "code", null: false
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "route_id"
    t.index ["route_id"], name: "index_buses_on_route_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.string "comment"
    t.decimal "value", precision: 5, scale: 5, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "route_id"
    t.index ["route_id"], name: "index_evaluations_on_route_id"
    t.index ["user_id"], name: "index_evaluations_on_user_id"
  end

  create_table "route_stops", force: :cascade do |t|
    t.integer "stop_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "station_id"
    t.integer "route_id"
    t.index ["route_id"], name: "index_route_stops_on_route_id"
    t.index ["station_id"], name: "index_route_stops_on_station_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "destination"
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", force: :cascade do |t|
    t.string "code", null: false
    t.decimal "latitude", precision: 10, scale: 6, null: false
    t.decimal "longitude", precision: 10, scale: 6, null: false
    t.string "address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "start_lat", precision: 10, scale: 6, null: false
    t.decimal "end_lat", precision: 10, scale: 6, null: false
    t.decimal "start_long", precision: 10, scale: 6, null: false
    t.decimal "end_long", precision: 10, scale: 6, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "route_id"
    t.index ["route_id"], name: "index_trips_on_route_id"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end