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

ActiveRecord::Schema.define(version: 2021_07_19_042525) do

  create_table "comments", force: :cascade do |t|
    t.integer "users_id", null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["users_id"], name: "index_comments_on_users_id"
  end

  create_table "parties", force: :cascade do |t|
    t.string "name"
    t.integer "capacity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "theme_id", null: false
    t.integer "user_id", null: false
    t.index ["theme_id"], name: "index_parties_on_theme_id"
    t.index ["user_id"], name: "index_parties_on_user_id"
  end

  create_table "parties_comments", force: :cascade do |t|
    t.integer "party_id", null: false
    t.integer "comment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id"], name: "index_parties_comments_on_comment_id"
    t.index ["party_id"], name: "index_parties_comments_on_party_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string "name"
    t.integer "era"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "image"
    t.boolean "admin"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "type"
  end

  create_table "users_parties", force: :cascade do |t|
    t.integer "party_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["party_id"], name: "index_users_parties_on_party_id"
    t.index ["user_id"], name: "index_users_parties_on_user_id"
  end

  add_foreign_key "comments", "users", column: "users_id"
  add_foreign_key "parties", "themes"
  add_foreign_key "parties", "users"
  add_foreign_key "parties_comments", "comments"
  add_foreign_key "parties_comments", "parties"
  add_foreign_key "users_parties", "parties"
  add_foreign_key "users_parties", "users"
end
