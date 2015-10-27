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

ActiveRecord::Schema.define(version: 20151027223156) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "super_admin"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "cards", force: :cascade do |t|
    t.string   "title"
    t.string   "color"
    t.string   "goal"
    t.string   "value"
    t.string   "source"
    t.string   "trend"
    t.string   "icon"
    t.integer  "order"
    t.integer  "page_id"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "percentage_complete", default: 0
    t.string   "goal_date"
    t.string   "value_date"
  end

  add_index "cards", ["page_id"], name: "index_cards_on_page_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "order"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden"
  end

  create_table "external_graphs", force: :cascade do |t|
    t.integer  "admin_id"
    t.integer  "page_id"
    t.integer  "order"
    t.string   "title"
    t.string   "external_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "width",        default: 12
  end

  add_index "external_graphs", ["page_id"], name: "index_external_graphs_on_page_id", using: :btree

  create_table "graphs", force: :cascade do |t|
    t.string   "title"
    t.string   "unit"
    t.integer  "page_id"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "admin_id"
    t.integer  "width",      default: 12
  end

  add_index "graphs", ["page_id"], name: "index_graphs_on_page_id", using: :btree
  add_index "graphs", ["title"], name: "index_graphs_on_title", unique: true, using: :btree

  create_table "lines", force: :cascade do |t|
    t.string  "title"
    t.integer "graph_id"
  end

  add_index "lines", ["graph_id"], name: "index_lines_on_graph_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "name"
    t.text     "intro_text"
    t.integer  "category_id"
    t.integer  "admin_id"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "landing_page"
  end

  create_table "points", force: :cascade do |t|
    t.float    "value"
    t.text     "notes"
    t.integer  "line_id"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "time"
    t.integer  "position"
  end

  add_index "points", ["line_id"], name: "index_points_on_line_id", using: :btree

end
