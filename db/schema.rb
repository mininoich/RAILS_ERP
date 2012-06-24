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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120624182141) do

  create_table "abilities", :force => true do |t|
    t.integer  "teacher_id"
    t.integer  "subject_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "absences", :force => true do |t|
    t.string   "justificative"
    t.integer  "student_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "absences", ["student_id"], :name => "index_absences_on_student_id"

  create_table "admins", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "admins", ["user_id"], :name => "index_admins_on_user_id"

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "ad_street"
    t.string   "ad_city"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contract_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contracts", :force => true do |t|
    t.date     "date_start"
    t.date     "date_end"
    t.integer  "student_id"
    t.integer  "company_id"
    t.integer  "contract_type_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "contracts", ["company_id"], :name => "index_contracts_on_company_id"
  add_index "contracts", ["contract_type_id"], :name => "index_contracts_on_contract_type_id"
  add_index "contracts", ["student_id"], :name => "index_contracts_on_student_id"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "lesson_id"
  end

  add_index "events", ["lesson_id"], :name => "index_events_on_lesson_id"

  create_table "klasses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lessons", :force => true do |t|
    t.datetime "date_hour_start"
    t.datetime "date_hour_end"
    t.integer  "subject_id"
    t.integer  "room_id"
    t.integer  "klass_id"
    t.integer  "teacher_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "lessons", ["klass_id"], :name => "index_lessons_on_klass_id"
  add_index "lessons", ["room_id"], :name => "index_lessons_on_room_id"
  add_index "lessons", ["subject_id"], :name => "index_lessons_on_subject_id"
  add_index "lessons", ["teacher_id"], :name => "index_lessons_on_teacher_id"

  create_table "messages", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.boolean  "sender_deleted",    :default => false
    t.boolean  "recipient_deleted", :default => false
    t.string   "subject"
    t.text     "body"
    t.datetime "read_at"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "rooms", :force => true do |t|
    t.string   "name"
    t.integer  "nb_places"
    t.integer  "nb_computers"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "students", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "klass_id"
  end

  add_index "students", ["klass_id"], :name => "index_students_on_klass_id"
  add_index "students", ["user_id"], :name => "index_students_on_user_id"

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "supervisors", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "supervisors", ["user_id"], :name => "index_supervisors_on_user_id"

  create_table "teachers", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "teachers", ["user_id"], :name => "index_teachers_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
