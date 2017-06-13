class InitilazeTables < ActiveRecord::Migration
  def change

    create_table "attendances", force: true do |t|
      t.integer  "training_class_id"
      t.date     "attendance_date"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "comments", force: true do |t|
      t.integer  "teacher_id"
      t.integer  "training_class_id"
      t.integer  "student_id"
      t.string   "text"
      t.date     "comment_date"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "dictation_scores", force: true do |t|
      t.integer  "student_id"
      t.integer  "dictation_id"
      t.integer  "score"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "dictations", force: true do |t|
      t.integer  "passing_line"
      t.date     "execute_date"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "training_class_id"
    end

    create_table "employees", force: true do |t|
      t.integer  "user_id"
      t.boolean  "admin",         default: false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.boolean  "delete_flag",   default: false
      t.boolean  "freezing_flag", default: false
    end

    create_table "entry_and_target_scores", force: true do |t|
      t.integer  "student_id"
      t.integer  "training_class_id" #暂时未用
      t.integer  "final_score"
      t.integer  "course_a_score"
      t.integer  "course_b_score"
      t.integer  "course_c_score"
      t.integer  "course_d_score"
      t.string   "exam_type"
      t.string   "score_type"
      t.string :exam_type  #SAT /TOEFL
      t.string :score_type #入口成绩 /月份期望成绩/最终期望成绩
      t.integer  "month"
      t.integer  "year"  #目标月份,若是最终期望成绩,则为空
      t.datetime "created_at"
      t.datetime "updated_at"

    end

    create_table "examinations", force: true do |t|
      t.integer  "training_class_id"
      t.integer  "test_paper_id"
      t.date     "test_date"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "name"
    end

    create_table "homework_finishes", force: true do |t|
      t.integer  "homework_id"
      t.integer  "student_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "homeworks", force: true do |t|
      t.string   "title"
      t.date     "distribution_date"
      t.date     "submit_date"
      t.string   "subject_type"
      t.integer  "teacher_id"
      t.integer  "training_class_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.boolean  "timing_flag",       default: false
    end

    create_table "questions", force: true do |t|
      t.integer  "index_number"
      t.integer  "difficulty"
      t.integer  "section_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "score_details", force: true do |t|
      t.string   "answer_result"
      t.integer  "score_number"
      t.integer  "simulate_test_score_id"
      t.integer  "question_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "scores", force: true do |t|
      t.integer  "examination_id"
      t.integer  "student_id"
      t.integer  "final_score"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "course_a_score"
      t.integer  "course_b_score"
      t.integer  "course_c_score"
      t.integer  "course_d_score"
      t.integer  "stat_01"
      t.integer  "stat_02"
      t.integer  "stat_03"
      t.integer  "stat_04"
      t.integer  "stat_05"
      t.integer  "stat_06"
      t.integer  "stat_07"
      t.integer  "stat_08"
      t.integer  "stat_09"
      t.integer  "stat_10"
      t.integer  "stat_11"
      t.integer  "stat_12"
      t.integer  "stat_13"
      t.integer  "stat_14"
      t.integer  "stat_15"
      t.integer  "stat_16"
      t.integer  "hard_level1"
      t.integer  "hard_level2"
      t.integer  "hard_level3"
      t.integer  "hard_level4"
      t.integer  "hard_level5"
    end

    create_table "sections", force: true do |t|
      t.string   "name"
      t.integer  "test_paper_id"
      t.string   "course_type"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "questions_count", default: 0
    end

    create_table "student_attendances", force: true do |t|
      t.integer  "student_id"
      t.integer  "attendance_id"
      t.string   "description"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "status_morning"
      t.string   "status_afternoon"
      t.string   "status_evening"
    end

    create_table "students", force: true do |t|
      t.integer  "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "parent_name"
      t.string   "parent_tel"
      t.string   "school"
      t.string   "qq_number"
      t.string   "tinypost_number"
      t.integer  "school_rank"
      t.integer  "total_toefl_times"
      t.integer  "total_sat_times"
      t.integer  "expect_toefl_times"
      t.string   "identify_card"
      t.date     "birth_day"
      t.string   "parent2_name"
      t.string   "parent2_tel"
      t.boolean  "delete_flag",        default: false
      t.boolean  "freezing_flag",      default: false
      t.integer  "creator_id"
    end

    create_table "students_test_papers", id: false, force: true do |t|
      t.integer  "student_id"
      t.integer  "test_paper_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "students_training_classes", id: false, force: true do |t|
      t.integer  "student_id"
      t.integer  "training_class_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "subjects", force: true do |t|
      t.string   "name"
      t.integer  "teacher_id"
      t.integer  "training_class_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "teachers", force: true do |t|
      t.integer  "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.boolean  "delete_flag",   default: false
      t.boolean  "freezing_flag", default: false
    end

    create_table "test_papers", force: true do |t|
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "sections_count", default: 0
      t.string   "exam_type"
    end

    create_table "text_books", force: true do |t|
      t.string   "name"
      t.string   "exam_type"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "text_books_training_classes", id: false, force: true do |t|
      t.integer  "text_book_id"
      t.integer  "training_class_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "training_classes", force: true do |t|
      t.string   "name"
      t.date     "start_date"
      t.date     "end_date"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "master_teacher_id"
      t.string   "exam_type",           default: "SAT"
      t.string   "training_class_type"
    end

    create_table "users", force: true do |t|
      t.string   "name"
      t.string   "email"
      t.string   "phone_number"
      t.string   "password",     default: ""
      t.string   "role_name"
      t.datetime "created_at"
      t.datetime "updated_at"
    end


  end
end
