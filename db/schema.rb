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

ActiveRecord::Schema.define(version: 20171011182547) do

  create_table "messages", force: :cascade do |t|
    t.integer "message_id"
    t.integer "sender_id"
    t.integer "recipient_id"
    t.integer "time"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "portfolio_media", force: :cascade do |t|
    t.integer "portfolio_id"
    t.string "media_url"
    t.string "media_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "portfolios", force: :cascade do |t|
    t.integer "user_id"
    t.integer "portfolio_id"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "transaction_id"
    t.integer "creator_id"
    t.integer "recipient_id"
    t.string "creation_date"
    t.string "completion_date"
    t.integer "amount"
    t.string "status"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "user_id"
    t.string "username"
    t.string "email"
    t.string "password"
    t.string "password_comfirm"
    t.string "first_name"
    t.string "last_name"
    t.string "display_name"
    t.integer "rating"
    t.string "biography"
    t.string "profile_image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
