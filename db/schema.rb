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

ActiveRecord::Schema[7.1].define(version: 2023_11_19_125512) do
  create_table "invitations", force: :cascade do |t|
    t.string "uuid"
    t.string "product"
    t.string "description"
    t.decimal "price"
    t.string "store_wilaya"
    t.string "store_location"
    t.string "delivery_type"
    t.decimal "local_delivery_price"
    t.string "active"
    t.integer "delivery_delay_hours"
    t.datetime "date"
    t.text "images"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "seller_id", null: false
    t.index ["seller_id"], name: "index_invitations_on_seller_id"
  end

  create_table "sellers", force: :cascade do |t|
    t.string "name"
    t.string "phoneNumber"
    t.string "email"
    t.string "firstName"
    t.string "businessName"
    t.string "location"
    t.string "wilaya"
    t.string "description"
    t.string "status"
    t.date "createdAt"
    t.string "rib"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "uuid"
    t.string "delivery_place"
    t.string "delivery_type"
    t.decimal "delivery_price"
    t.datetime "delivery_date"
    t.string "state"
    t.string "outcome"
    t.string "activation_key"
    t.datetime "payment_date"
    t.boolean "certified_delivery"
    t.string "certified_company"
    t.integer "invitation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invitation_id"], name: "index_transactions_on_invitation_id"
  end

  add_foreign_key "invitations", "sellers"
  add_foreign_key "transactions", "invitations"
end
