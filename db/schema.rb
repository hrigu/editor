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

ActiveRecord::Schema.define(version: 20160907181050) do

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.text     "content",    limit: 65535, null: false
    t.string   "author",                   null: false
    t.integer  "person_id",                null: false
    t.integer  "user_id",                  null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["person_id"], name: "index_comments_on_person_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "people", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "s_n",             null: false
    t.integer  "register_number", null: false
    t.string   "first_name",      null: false
    t.string   "family_name",     null: false
    t.string   "lawyer",          null: false
    t.string   "contact_persons"
    t.integer  "comments_count"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string   "email",                              null: false
    t.string   "encrypted_password",                 null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "comments", "people", on_delete: :cascade
  add_foreign_key "comments", "users", on_delete: :cascade
end
