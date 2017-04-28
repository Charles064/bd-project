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

ActiveRecord::Schema.define(version: 20170428153119) do

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
    t.string   "password_digest"
  end

  create_table "order_products", force: :cascade do |t|
    t.integer "product_id"
    t.integer "order_id"
    t.float   "price"
    t.integer "quantity"
  end

  create_table "order_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "order_id"
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
    t.integer  "temp_id"
  end

  add_index "products", ["temp_id"], name: "index_products_on_temp_id"

  create_table "temp_files", force: :cascade do |t|
    t.integer "product_id"
    t.string  "p_name"
    t.float   "p_price"
    t.integer "p_quant"
  end

  add_index "temp_files", ["product_id"], name: "index_temp_files_on_product_id"

  create_table "temps", force: :cascade do |t|
    t.integer "product_id"
    t.string  "product_name"
    t.float   "product_price"
    t.integer "product_quantity"
  end

  add_index "temps", ["product_id"], name: "index_temps_on_product_id"

  create_table "users", force: :cascade do |t|
    t.string   "names"
    t.string   "lastname_1"
    t.string   "lastname_2"
    t.string   "email"
    t.string   "username"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
  end

end
