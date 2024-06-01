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

ActiveRecord::Schema[7.1].define(version: 2024_05_29_101625) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "academic_years", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assessment_grades", force: :cascade do |t|
    t.decimal "start_mark", null: false
    t.decimal "end_mark", null: false
    t.string "letter_grade", null: false
    t.boolean "remark", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assessment_types", force: :cascade do |t|
    t.string "name"
    t.bigint "staff_id", null: false
    t.bigint "term_id", null: false
    t.boolean "end_of_term", default: false
    t.boolean "mandatory", default: false
    t.boolean "released", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["staff_id"], name: "index_assessment_types_on_staff_id"
    t.index ["term_id"], name: "index_assessment_types_on_term_id"
  end

  create_table "form_subjects", force: :cascade do |t|
    t.bigint "form_id", null: false
    t.bigint "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id", "subject_id"], name: "index_form_subjects_on_form_id_and_subject_id", unique: true
    t.index ["form_id"], name: "index_form_subjects_on_form_id"
    t.index ["subject_id"], name: "index_form_subjects_on_subject_id"
  end

  create_table "forms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "term_id", null: false
    t.bigint "form_id", null: false
    t.boolean "registered", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_registrations_on_form_id"
    t.index ["student_id"], name: "index_registrations_on_student_id"
    t.index ["term_id"], name: "index_registrations_on_term_id"
  end

  create_table "scores", force: :cascade do |t|
    t.bigint "subject_assessment_id", null: false
    t.bigint "student_id", null: false
    t.decimal "score"
    t.bigint "assessment_grade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assessment_grade_id"], name: "index_scores_on_assessment_grade_id"
    t.index ["student_id"], name: "index_scores_on_student_id"
    t.index ["subject_assessment_id"], name: "index_scores_on_subject_assessment_id"
  end

  create_table "staff_subjects", force: :cascade do |t|
    t.bigint "staff_id", null: false
    t.bigint "subject_id", null: false
    t.bigint "term_id", null: false
    t.bigint "form_id", null: false
    t.boolean "core_teacher"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_staff_subjects_on_form_id"
    t.index ["staff_id"], name: "index_staff_subjects_on_staff_id"
    t.index ["subject_id"], name: "index_staff_subjects_on_subject_id"
    t.index ["term_id"], name: "index_staff_subjects_on_term_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "title"
    t.string "username"
    t.string "first_name"
    t.string "surname", null: false
    t.integer "gender"
    t.integer "marital_status"
    t.date "date_of_birth"
    t.date "date_of_appointment"
    t.string "phone_number"
    t.boolean "is_admin", default: false
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email", "username"], name: "index_staffs_on_email_and_username", unique: true
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true
  end

  create_table "student_final_results", force: :cascade do |t|
    t.bigint "assessment_type_id", null: false
    t.bigint "student_id", null: false
    t.decimal "total_marks", default: "0.0"
    t.decimal "best_subjects_total", default: "0.0"
    t.boolean "final_remark", default: false
    t.string "final_letter_grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assessment_type_id"], name: "index_student_final_results_on_assessment_type_id"
    t.index ["student_id"], name: "index_student_final_results_on_student_id"
  end

  create_table "student_subjects", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "subject_id", null: false
    t.bigint "term_id", null: false
    t.bigint "form_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_student_subjects_on_form_id"
    t.index ["student_id"], name: "index_student_subjects_on_student_id"
    t.index ["subject_id"], name: "index_student_subjects_on_subject_id"
    t.index ["term_id"], name: "index_student_subjects_on_term_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "title"
    t.string "username"
    t.string "first_name"
    t.string "surname"
    t.integer "gender"
    t.date "date_of_birth"
    t.string "date_of_enrollment"
    t.string "phone_number"
    t.string "district"
    t.string "t_a"
    t.string "village"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  create_table "subject_assessments", force: :cascade do |t|
    t.bigint "staff_subject_id", null: false
    t.bigint "assessment_type_id", null: false
    t.boolean "submitted", default: false
    t.boolean "approved", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assessment_type_id"], name: "index_subject_assessments_on_assessment_type_id"
    t.index ["staff_subject_id"], name: "index_subject_assessments_on_staff_subject_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.boolean "compulsory", default: false
    t.boolean "crucial", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "terms", force: :cascade do |t|
    t.string "name"
    t.bigint "academic_year_id", null: false
    t.boolean "registration_open", default: true
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academic_year_id"], name: "index_terms_on_academic_year_id"
  end

  add_foreign_key "assessment_types", "staffs"
  add_foreign_key "assessment_types", "terms"
  add_foreign_key "form_subjects", "forms"
  add_foreign_key "form_subjects", "subjects"
  add_foreign_key "registrations", "forms"
  add_foreign_key "registrations", "students"
  add_foreign_key "registrations", "terms"
  add_foreign_key "scores", "assessment_grades"
  add_foreign_key "scores", "students"
  add_foreign_key "scores", "subject_assessments"
  add_foreign_key "staff_subjects", "forms"
  add_foreign_key "staff_subjects", "staffs"
  add_foreign_key "staff_subjects", "subjects"
  add_foreign_key "staff_subjects", "terms"
  add_foreign_key "student_final_results", "assessment_types"
  add_foreign_key "student_final_results", "students"
  add_foreign_key "student_subjects", "forms"
  add_foreign_key "student_subjects", "students"
  add_foreign_key "student_subjects", "subjects"
  add_foreign_key "student_subjects", "terms"
  add_foreign_key "subject_assessments", "assessment_types"
  add_foreign_key "subject_assessments", "staff_subjects"
  add_foreign_key "terms", "academic_years"
end
