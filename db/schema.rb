# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_14_201701) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.bigint "user_id", null: false
    t.bigint "place_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_comments_on_place_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favourite_places", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "place_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_favourite_places_on_place_id"
    t.index ["user_id"], name: "index_favourite_places_on_user_id"
  end

  create_table "favourite_trips", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_favourite_trips_on_trip_id"
    t.index ["user_id"], name: "index_favourite_trips_on_user_id"
  end

  create_table "place_categories", force: :cascade do |t|
    t.bigint "place_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_place_categories_on_category_id"
    t.index ["place_id"], name: "index_place_categories_on_place_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "address"
    t.float "geo_long"
    t.float "geo_lat"
    t.text "description"
    t.float "average_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "url_image"
    t.integer "poi_id"
  end

  create_table "trip_places", force: :cascade do |t|
    t.bigint "place_id", null: false
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_trip_places_on_place_id"
    t.index ["trip_id"], name: "index_trip_places_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "departure"
    t.string "arrival"
    t.float "geo_long_departure"
    t.float "geo_lat_departure"
    t.float "geo_long_arrival"
    t.float "geo_lat_arrival"
    t.float "kms"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "category"
  end

  create_table "user_places", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "place_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_user_places_on_place_id"
    t.index ["user_id"], name: "index_user_places_on_user_id"
  end

  create_table "user_trips", force: :cascade do |t|
    t.date "date"
    t.bigint "user_id", null: false
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_user_trips_on_trip_id"
    t.index ["user_id"], name: "index_user_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_pic"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "places"
  add_foreign_key "comments", "users"
  add_foreign_key "favourite_places", "places"
  add_foreign_key "favourite_places", "users"
  add_foreign_key "favourite_trips", "trips"
  add_foreign_key "favourite_trips", "users"
  add_foreign_key "place_categories", "categories"
  add_foreign_key "place_categories", "places"
  add_foreign_key "trip_places", "places"
  add_foreign_key "trip_places", "trips"
  add_foreign_key "user_places", "places"
  add_foreign_key "user_places", "users"
  add_foreign_key "user_trips", "trips"
  add_foreign_key "user_trips", "users"
end
