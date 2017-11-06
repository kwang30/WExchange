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

ActiveRecord::Schema.define(version: 20171105213017) do

  create_table "chats", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sender_id"
    t.integer "recipient_id"
    t.index ["recipient_id", "sender_id"], name: "index_chats_on_recipient_id_and_sender_id", unique: true
    t.index ["recipient_id"], name: "index_chats_on_recipient_id"
    t.index ["sender_id"], name: "index_chats_on_sender_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "chat_id"
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string "imageable_type"
    t.integer "imageable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["imageable_type", "imageable_id"], name: "index_photos_on_imageable_type_and_imageable_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.integer "user_id"
    t.integer "portfolio_id"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "star", default: 1
    t.text "text"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "recipient_id"
    t.integer "creator_id"
    t.string "request_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "request_message"
    t.string "transaction_title"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "full_name"
    t.string "display_name"
    t.string "email"
    t.integer "rating"
    t.string "phone_number"
    t.string "biography"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["display_name"], name: "index_users_on_display_name", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
