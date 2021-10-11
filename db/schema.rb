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

ActiveRecord::Schema.define(version: 2021_10_11_074704) do

  create_table "alternatives", force: :cascade do |t|
    t.string "sentence"
    t.integer "problem_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["problem_id"], name: "index_alternatives_on_problem_id"
  end

  create_table "problem_types", force: :cascade do |t|
    t.string "name"
    t.text "sentence"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "problems", force: :cascade do |t|
    t.text "sentence"
    t.text "explanation"
    t.string "genre"
    t.integer "alternative_id"
    t.integer "problem_type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["alternative_id"], name: "index_problems_on_alternative_id"
    t.index ["problem_type_id"], name: "index_problems_on_problem_type_id"
  end

  add_foreign_key "alternatives", "problems"
  add_foreign_key "problems", "alternatives"
  add_foreign_key "problems", "problem_types"
end
