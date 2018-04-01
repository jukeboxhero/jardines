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

ActiveRecord::Schema.define(version: 20180401212130) do

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

end
