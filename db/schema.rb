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

ActiveRecord::Schema.define(version: 20140727182657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assets", force: true do |t|
    t.string   "name"
    t.integer  "type"
    t.integer  "organization_id"
    t.string   "account_number"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departaments", force: true do |t|
    t.string   "depname"
    t.integer  "organization_id"
    t.string   "adress"
    t.string   "phone"
    t.string   "city"
    t.integer  "zipcode"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "departaments", ["organization_id"], name: "index_departaments_on_organization_id", using: :btree

  create_table "knowledge_bases", force: true do |t|
    t.integer  "type"
    t.string   "kbname"
    t.text     "description"
    t.text     "instruction"
    t.integer  "create_user_id"
    t.integer  "update_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "knowledge_bases", ["create_user_id"], name: "index_knowledge_bases_on_create_user_id", using: :btree
  add_index "knowledge_bases", ["update_user_id"], name: "index_knowledge_bases_on_update_user_id", using: :btree

  create_table "organizations", force: true do |t|
    t.string   "orgname"
    t.string   "address"
    t.string   "phone"
    t.string   "city"
    t.integer  "zipcode"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "priorities", force: true do |t|
    t.string   "prname"
    t.integer  "days_to_close"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "problems", force: true do |t|
    t.integer  "create_user_id"
    t.integer  "performer_user_id"
    t.integer  "last_update_user_id"
    t.integer  "priority_id"
    t.string   "state"
    t.integer  "category_id"
    t.integer  "asset_id"
    t.text     "description"
    t.datetime "time_to_close"
    t.datetime "fact_close"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "problems", ["create_user_id"], name: "index_problems_on_create_user_id", using: :btree
  add_index "problems", ["last_update_user_id"], name: "index_problems_on_last_update_user_id", using: :btree
  add_index "problems", ["performer_user_id"], name: "index_problems_on_performer_user_id", using: :btree

  create_table "solutions", force: true do |t|
    t.integer  "problem_id"
    t.integer  "create_user_id"
    t.integer  "state_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "solutions", ["create_user_id"], name: "index_solutions_on_create_user_id", using: :btree
  add_index "solutions", ["problem_id"], name: "index_solutions_on_problem_id", using: :btree
  add_index "solutions", ["state_id"], name: "index_solutions_on_state_id", using: :btree

  create_table "uploads", force: true do |t|
    t.string  "avatar"
    t.integer "attachable_id"
    t.string  "attachable_type"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "firstname",              default: "", null: false
    t.string   "lastname",               default: "", null: false
    t.string   "phone"
    t.integer  "role"
    t.integer  "departament_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
