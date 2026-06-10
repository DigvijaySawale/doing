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

ActiveRecord::Schema[8.1].define(version: 2026_06_10_175954) do
  create_table "tasks", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.text "description"
    t.date "due_date"
    t.integer "duration_minutes"
    t.time "end_time"
    t.boolean "has_time", default: false, null: false
    t.boolean "is_recurring", default: false, null: false
    t.integer "priority", default: 0, null: false
    t.date "scheduled_date", null: false
    t.time "start_time"
    t.integer "status", default: 0, null: false
    t.string "title", null: false
    t.datetime "updated_at", null: false
    t.index ["completed_at"], name: "index_tasks_on_completed_at"
    t.index ["due_date"], name: "index_tasks_on_due_date"
    t.index ["priority"], name: "index_tasks_on_priority"
    t.index ["scheduled_date"], name: "index_tasks_on_scheduled_date"
    t.index ["status"], name: "index_tasks_on_status"
  end
end
