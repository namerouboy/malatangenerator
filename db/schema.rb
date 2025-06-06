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

ActiveRecord::Schema[7.1].define(version: 2025_06_05_045657) do
  create_table "ingredirnt", force: :cascade do |t|
    t.string "category"
    t.string "name"
    t.integer "weight"
    t.integer "calorie"
    t.string "explanation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "malatan_syokuzais", force: :cascade do |t|
    t.integer "malatan_id", null: false
    t.integer "syokuzai_id", null: false
    t.integer "count", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["malatan_id"], name: "index_malatan_syokuzais_on_malatan_id"
    t.index ["syokuzai_id"], name: "index_malatan_syokuzais_on_syokuzai_id"
  end

  create_table "malatans", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suuryous", force: :cascade do |t|
    t.integer "suuryou"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "syokuzais", force: :cascade do |t|
    t.string "category"
    t.string "name"
    t.integer "weight"
    t.integer "calorie"
    t.text "explanation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "malatan_syokuzais", "malatans"
  add_foreign_key "malatan_syokuzais", "syokuzais"
end
