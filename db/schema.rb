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

ActiveRecord::Schema.define(version: 20180608121932) do

  create_table "mainstores", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "prefecture"
    t.string "city"
    t.string "other_address"
    t.text "access"
    t.string "tel"
    t.text "business_hour"
    t.string "hp"
    t.boolean "wifi"
    t.boolean "socket"
    t.boolean "smoking"
    t.boolean "iccard"
    t.decimal "lat"
    t.decimal "lng"
    t.integer "mainstore_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mainstore_id"], name: "index_stores_on_mainstore_id"
  end

end
