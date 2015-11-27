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

ActiveRecord::Schema.define(version: 20151127002228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_items", force: :cascade do |t|
    t.integer  "card_id"
    t.integer  "count"
    t.string   "size"
    t.boolean  "paid",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "card_items", ["card_id"], name: "index_card_items_on_card_id", using: :btree

  create_table "cards", force: :cascade do |t|
    t.string   "email"
    t.string   "billing_first_name"
    t.string   "billing_last_name"
    t.string   "billing_address_1"
    t.string   "billing_address_2"
    t.string   "billing_city"
    t.string   "billing_state"
    t.string   "billing_zip"
    t.string   "shipping_first_name"
    t.string   "shipping_last_name"
    t.string   "shipping_address_1"
    t.string   "shipping_address_2"
    t.string   "shipping_city"
    t.string   "shipping_state"
    t.string   "shipping_zip"
    t.integer  "amount"
    t.integer  "braintree_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
