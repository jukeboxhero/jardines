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

ActiveRecord::Schema.define(version: 20180404050522) do

  create_table "agenda_items", force: :cascade do |t|
    t.string "name"
    t.integer "meeting_id"
    t.integer "owner_id"
    t.integer "item_type", default: 1
    t.bigint "duration"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meeting_id"], name: "index_agenda_items_on_meeting_id"
    t.index ["owner_id"], name: "index_agenda_items_on_owner_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "title"
    t.text "file_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "location"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "title"
    t.text "image_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meetings", force: :cascade do |t|
    t.string "name", null: false
    t.string "location"
    t.datetime "meeting_time"
    t.string "description"
    t.integer "chairperson_id"
    t.integer "minutetaker_id"
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chairperson_id"], name: "index_meetings_on_chairperson_id"
    t.index ["creator_id"], name: "index_meetings_on_creator_id"
    t.index ["minutetaker_id"], name: "index_meetings_on_minutetaker_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "author_id_id", null: false
    t.string "subject", null: false
    t.string "body", null: false
    t.integer "parent_id_id"
    t.string "messagable_type"
    t.integer "messagable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id_id"], name: "index_messages_on_author_id_id"
    t.index ["messagable_type", "messagable_id"], name: "index_messages_on_messagable_type_and_messagable_id"
    t.index ["parent_id_id"], name: "index_messages_on_parent_id_id"
  end

  create_table "notes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title", null: false
    t.string "description", null: false
    t.string "notable_type"
    t.integer "notable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notable_type", "notable_id"], name: "index_notes_on_notable_type_and_notable_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.integer "owner_id_id"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id_id"], name: "index_projects_on_owner_id_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.string "title", null: false
    t.string "description", null: false
    t.integer "state", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "residences", force: :cascade do |t|
    t.string "address", null: false
    t.integer "square_footage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "taskable_type"
    t.integer "taskable_id"
    t.string "title", null: false
    t.string "description", null: false
    t.datetime "due_date"
    t.boolean "send_reminder", default: false
    t.datetime "reminder_time_in_advance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["taskable_type", "taskable_id"], name: "index_tasks_on_taskable_type_and_taskable_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "user_groups", force: :cascade do |t|
    t.string "name", null: false
    t.integer "image_id_id"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_id_id"], name: "index_user_groups_on_image_id_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "first_name"
    t.string "last_name"
    t.string "nickname"
    t.string "email"
    t.string "phone"
    t.integer "image_id"
    t.integer "role", default: 0
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["image_id"], name: "index_users_on_image_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.integer "proposal_id_id"
    t.integer "user_id_id"
    t.integer "residence_id_id"
    t.integer "state", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proposal_id_id"], name: "index_votes_on_proposal_id_id"
    t.index ["residence_id_id"], name: "index_votes_on_residence_id_id"
    t.index ["user_id_id"], name: "index_votes_on_user_id_id"
  end

end
