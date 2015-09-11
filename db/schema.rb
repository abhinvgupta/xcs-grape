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

ActiveRecord::Schema.define(version: 20150911065413) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ans", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "choice_order"
    t.boolean  "correct_answer"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "ans_texts", force: :cascade do |t|
    t.integer  "answer_id"
    t.integer  "language_id"
    t.text     "stem_text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "answer_texts", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "answer_id"
    t.integer  "language_id"
    t.text     "answer_text"
  end

  create_table "answers", force: :cascade do |t|
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "question_id"
    t.string   "correct_answer"
    t.integer  "choice_order"
    t.integer  "choice_label"
    t.string   "choice_media_url"
    t.string   "choice_selected_media_url"
    t.string   "answer_name"
    t.string   "question_name"
  end

  create_table "api_keys", force: :cascade do |t|
    t.string   "access_token", limit: 250, null: false
    t.integer  "user_id",                  null: false
    t.datetime "expires_at",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ass_categories", force: :cascade do |t|
    t.integer  "shot_id"
    t.integer  "c_type_id"
    t.string   "timer_layout"
    t.string   "timer"
    t.boolean  "random_question"
    t.string   "expected_time"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "blocks", force: :cascade do |t|
    t.integer "subject_id"
    t.integer "grade_id"
    t.integer "board_id"
    t.integer "block_number"
    t.text    "block_desc"
    t.integer "block_icon"
  end

  create_table "category_types", force: :cascade do |t|
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "ssn"
    t.integer  "salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "five", force: :cascade do |t|
    t.string "five_name", limit: 50
  end

  create_table "fivealookup", force: :cascade do |t|
    t.integer "lp_id"
    t.text    "description"
  end

  create_table "languages", force: :cascade do |t|
    t.string   "lang"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessonplans", force: :cascade do |t|
    t.integer "block_id"
    t.integer "lp_number"
    t.string  "lp_name",   limit: 250, null: false
    t.text    "lp_desc"
    t.text    "lp_icon"
  end

  create_table "permission_matrices", force: :cascade do |t|
    t.integer  "permission_id"
    t.integer  "role_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "permission_tables", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "q_categories", force: :cascade do |t|
    t.integer  "q_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ques_texts", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "language_id"
    t.text     "stem_text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "question_texts", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "language_id"
    t.text     "stem_text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "question_name"
    t.string   "stem_media_url"
    t.string   "question_type"
    t.string   "layout"
    t.string   "media_url"
    t.string   "subject"
    t.integer  "grade"
    t.string   "assessment_type"
    t.integer  "level"
    t.integer  "display_order"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "quests", force: :cascade do |t|
    t.string   "question_name"
    t.string   "question_type"
    t.string   "layout"
    t.string   "timer_layout"
    t.boolean  "PRE"
    t.boolean  "PRACTICE"
    t.boolean  "POST"
    t.boolean  "random"
    t.string   "expected_time"
    t.integer  "level"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "drop_count"
    t.string   "drop_area"
    t.boolean  "KQ"
    t.integer  "shot_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "restaurants", ["name"], name: "index_restaurants_on_name", unique: true, using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "roses", force: :cascade do |t|
    t.text     "name"
    t.integer  "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "session_activity_data", force: :cascade do |t|
    t.integer  "student_session_id"
    t.text     "learning_objective_id"
    t.integer  "start_level"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "session_activity_levels_data", force: :cascade do |t|
    t.integer  "level"
    t.integer  "try_again_count"
    t.integer  "relive_try_again_count"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "lang_toggle",              limit: 250
    t.integer  "session_activity_data_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "session_assessments", force: :cascade do |t|
    t.integer  "student_session_id"
    t.string   "assessment_type",    limit: 250
    t.string   "subject",            limit: 250
    t.integer  "grade"
    t.string   "learning_objective", limit: 250
    t.string   "time_spent",         limit: 250
    t.string   "state",              limit: 250
    t.integer  "exit_level"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "session_questions", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "display_sequence"
    t.integer  "session_assessment_id"
    t.string   "time_spent",            limit: 250
    t.integer  "answer_id"
    t.integer  "retries"
    t.integer  "lang_toggle"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "session_video_data", force: :cascade do |t|
    t.string   "student_session_id",    limit: 250
    t.integer  "learning_objective_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "rewind_count"
    t.integer  "forward_count"
    t.text     "lang_toggle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shot_types", id: false, force: :cascade do |t|
    t.integer  "id",         null: false
    t.integer  "course_id"
    t.string   "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_session_data", force: :cascade do |t|
    t.integer  "student_session_id"
    t.text     "data"
    t.string   "state",              limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_id"
  end

  create_table "student_sessions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "generated_id", limit: 250
    t.string   "state",        limit: 250
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "subject", limit: 50
  end

  create_table "users", primary_key: "user_id", force: :cascade do |t|
    t.string   "email",              limit: 250,                 null: false
    t.string   "encrypted_password", limit: 250,                 null: false
    t.string   "first_name",         limit: 250
    t.string   "last_name",          limit: 250
    t.boolean  "admin",                          default: false, null: false
    t.string   "username",           limit: 250
    t.integer  "age"
    t.string   "gender",             limit: 250
    t.integer  "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "confirmation_token"
    t.text     "role"
  end

  create_table "users2", force: :cascade do |t|
    t.string   "name"
    t.string   "authentication_token"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "email",                default: "", null: false
    t.string   "encrypted_password",   default: "", null: false
    t.string   "reset_password_token"
    t.string   "ff"
  end

  add_index "users2", ["authentication_token"], name: "index_geasers_on_authentication_token", unique: true, using: :btree
  add_index "users2", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users2", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "api_keys", "users", primary_key: "user_id", name: "api_keys_user_id_fkey", on_delete: :nullify
  add_foreign_key "q_categories", "ass_categories", column: "category_id", name: "q_categories_category_id_fkey"
  add_foreign_key "q_categories", "quests", column: "q_id", name: "q_categories_q_id_fkey"
  add_foreign_key "ques_texts", "languages", name: "ques_texts_language_id_fkey"
  add_foreign_key "ques_texts", "quests", column: "question_id", name: "ques_texts_question_id_fkey"
end
