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

ActiveRecord::Schema.define(version: 20150921081552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body"
    t.string   "resource_id",   limit: 255, null: false
    t.string   "resource_type", limit: 255, null: false
    t.integer  "author_id"
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "answer_texts", force: :cascade do |t|
    t.integer  "answer_id"
    t.integer  "language_id"
    t.text     "answer_text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.string   "correct_answer"
    t.integer  "choice_order"
    t.integer  "choice_label"
    t.string   "choice_media_url"
    t.string   "choice_selected_media_url"
    t.string   "answer_name"
    t.string   "question_name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "api_keys", force: :cascade do |t|
    t.string   "access_token", limit: 255
    t.datetime "expires_at"
    t.datetime "disabled_at"
    t.integer  "user_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "api_keys", ["access_token"], name: "index_api_keys_on_access_token", unique: true, using: :btree
  add_index "api_keys", ["user_id"], name: "index_api_keys_on_user_id", using: :btree

  create_table "languages", force: :cascade do |t|
    t.string   "lang"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lesson_videos", force: :cascade do |t|
    t.integer  "lesson_id"
    t.string   "name",        limit: 255
    t.text     "description"
    t.string   "language",    limit: 255
    t.string   "content_url", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "subject",     limit: 255
    t.string   "grade",       limit: 255
    t.text     "description"
    t.string   "lesson_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "session_activity_data", force: :cascade do |t|
    t.integer  "student_session_id"
    t.integer  "learning_objective_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "start_level"
    t.datetime "start_time"
    t.datetime "end_time"
  end

  create_table "session_activity_levels_data", force: :cascade do |t|
    t.integer  "level"
    t.integer  "try_again_count"
    t.integer  "relive_try_again_count"
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean  "lang_toggle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "session_activity_data_id"
    t.string   "activity_result",          limit: 250
    t.integer  "retries_count"
  end

  create_table "session_answers", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "display_sequence"
    t.integer  "session_question_id"
    t.integer  "answer_id"
    t.integer  "session_assessment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "session_assessments", force: :cascade do |t|
    t.integer  "student_session_id"
    t.string   "assessment_type",       limit: 255
    t.string   "subject",               limit: 255
    t.string   "grade",                 limit: 255
    t.integer  "learning_objective_id"
    t.decimal  "time_spent"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                 limit: 255
    t.integer  "exit_level"
    t.datetime "start_time"
    t.datetime "end_time"
  end

  create_table "session_questions", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "display_sequence"
    t.integer  "session_assessment_id"
    t.decimal  "time_spent"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "answer_id"
    t.integer  "retries"
    t.boolean  "lang_toggle"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "user_response",         limit: 250
    t.string   "result",                limit: 250
    t.text     "column15"
  end

  create_table "session_video_data", force: :cascade do |t|
    t.integer  "student_session_id"
    t.integer  "learning_objective_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "rewind_count"
    t.integer  "forward_count"
    t.boolean  "lang_toggle"
  end

  create_table "student_session_data", force: :cascade do |t|
    t.integer  "student_session_id"
    t.integer  "student_id"
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",              limit: 255, default: "NOT PROCESSED"
  end

  create_table "student_sessions", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "user_id"
    t.string   "generated_id", limit: 255
    t.string   "state",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "subject",    limit: 255
    t.string   "grade",      limit: 255
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.integer  "age"
    t.string   "gender",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "email",              limit: 255,                 null: false
    t.string   "encrypted_password", limit: 128,                 null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128,                 null: false
    t.string   "first_name",         limit: 255
    t.string   "last_name",          limit: 255
    t.boolean  "admin",                          default: false, null: false
    t.string   "username",           limit: 255
    t.string   "role",               limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
