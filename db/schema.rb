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

ActiveRecord::Schema.define(version: 20170418020438) do

  create_table "clients", force: :cascade do |t|
    t.string   "names"
    t.string   "ln1"
    t.string   "ln2"
    t.string   "email"
    t.string   "u_name"
    t.string   "pwd"
    t.date     "b_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: :cascade do |t|
    t.float    "t_cost"
    t.date     "date"
    t.string   "payment"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["client_id"], name: "index_orders_on_client_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.integer  "in_stock"
    t.boolean  "perish"
    t.date     "xp_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
