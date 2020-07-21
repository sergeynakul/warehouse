# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_11_122901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.string "title", null: false
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "title", null: false
    t.decimal "supply_price", precision: 8, scale: 2, null: false
    t.decimal "shipment_price", precision: 8, scale: 2, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products_movements", force: :cascade do |t|
    t.bigint "product_id"
    t.integer "quantity", null: false
    t.bigint "location_id"
    t.date "created_at", null: false
    t.index ["created_at"], name: "index_products_movements_on_created_at"
    t.index ["location_id"], name: "index_products_movements_on_location_id"
    t.index ["product_id"], name: "index_products_movements_on_product_id"
  end

  add_foreign_key "products_movements", "locations"
  add_foreign_key "products_movements", "products"
end
