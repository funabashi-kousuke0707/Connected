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

ActiveRecord::Schema.define(version: 2022_05_22_100855) do

  create_table "comments", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "text"
    t.bigint "post_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "guestcomment_to_userposts", charset: "utf8mb4", force: :cascade do |t|
    t.string "text"
    t.string "name"
    t.bigint "user_post_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_post_id"], name: "index_guestcomment_to_userposts_on_user_post_id"
  end

  create_table "posts", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_id"
  end

  create_table "user_comments", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "post_id"
    t.string "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["post_id"], name: "index_user_comments_on_post_id"
    t.index ["user_id"], name: "index_user_comments_on_user_id"
  end

  create_table "user_posts", charset: "utf8mb4", force: :cascade do |t|
    t.string "text"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.string "name"
    t.index ["user_id"], name: "index_user_posts_on_user_id"
  end

  create_table "usercomment_to_userposts", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "text"
    t.bigint "user_post_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_usercomment_to_userposts_on_user_id"
    t.index ["user_post_id"], name: "index_usercomment_to_userposts_on_user_post_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "guestcomment_to_userposts", "user_posts"
  add_foreign_key "user_comments", "posts"
  add_foreign_key "user_comments", "users"
  add_foreign_key "user_posts", "users"
  add_foreign_key "usercomment_to_userposts", "user_posts"
  add_foreign_key "usercomment_to_userposts", "users"
end
