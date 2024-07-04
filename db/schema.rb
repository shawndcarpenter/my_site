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

ActiveRecord::Schema[7.1].define(version: 2024_07_04_173451) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "education_points", force: :cascade do |t|
    t.string "text"
    t.bigint "education_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["education_id"], name: "index_education_points_on_education_id"
  end

  create_table "educations", force: :cascade do |t|
    t.string "name"
    t.string "degree"
    t.string "years"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "experience_points", force: :cascade do |t|
    t.string "text"
    t.bigint "experience_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experience_id"], name: "index_experience_points_on_experience_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.string "title"
    t.string "location"
    t.string "time"
    t.string "company"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_points", force: :cascade do |t|
    t.string "text"
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_points_on_project_id"
  end

  create_table "project_skills", force: :cascade do |t|
    t.string "text"
    t.bigint "project_id", null: false
    t.bigint "skill_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_skills_on_project_id"
    t.index ["skill_id"], name: "index_project_skills_on_skill_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "github"
    t.string "description"
    t.string "time"
    t.integer "collaborators"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "education_points", "educations"
  add_foreign_key "experience_points", "experiences"
  add_foreign_key "project_points", "projects"
  add_foreign_key "project_skills", "projects"
  add_foreign_key "project_skills", "skills"
end
