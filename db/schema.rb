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

ActiveRecord::Schema.define(version: 2022_04_30_122550) do

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "document"
    t.string "phone"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dashboards", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "installs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_installs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_installs_on_reset_password_token", unique: true
  end

  create_table "parts", force: :cascade do |t|
    t.string "name"
    t.float "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "model"
  end

  create_table "sale_parts", force: :cascade do |t|
    t.integer "sale_id"
    t.integer "part_id"
    t.float "part_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["part_id"], name: "index_sale_parts_on_part_id"
    t.index ["sale_id"], name: "index_sale_parts_on_sale_id"
  end

  create_table "sales", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "service_id"
    t.integer "client_id"
    t.boolean "finished"
    t.index ["client_id"], name: "index_sales_on_client_id"
    t.index ["service_id"], name: "index_sales_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "title"
    t.boolean "status"
    t.date "estimative"
    t.float "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "vehicle_id"
    t.date "finish_date"
    t.index ["vehicle_id"], name: "index_services_on_vehicle_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "status"
    t.date "estimative"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "service_id"
    t.date "finish_date"
    t.index ["service_id"], name: "index_tasks_on_service_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "model"
    t.string "registration_plate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "client_id"
    t.index ["client_id"], name: "index_vehicles_on_client_id"
  end

  add_foreign_key "vehicles", "clients"
end
