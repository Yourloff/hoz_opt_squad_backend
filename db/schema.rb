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

ActiveRecord::Schema[7.0].define(version: 2022_07_13_170404) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "basket_products", force: :cascade do |t|
    t.bigint "products_id", null: false
    t.bigint "baskets_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
    t.index ["baskets_id"], name: "index_basket_products_on_baskets_id"
    t.index ["products_id"], name: "index_basket_products_on_products_id"
  end

  create_table "baskets", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_baskets_on_client_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "surname"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.string "org"
    t.string "person_status"
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["phone"], name: "index_clients_on_phone", unique: true
  end

  create_table "orders", force: :cascade do |t|
    t.string "num_order"
    t.integer "quantity"
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "basket_product_id", null: false
    t.index ["basket_product_id"], name: "index_orders_on_basket_product_id"
    t.index ["client_id"], name: "index_orders_on_client_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "article_number"
    t.string "title"
    t.float "price"
    t.string "image_uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "subcategories_id", null: false
    t.boolean "is_available?", default: true
    t.string "description", default: [], array: true
    t.index ["subcategories_id"], name: "index_products_on_subcategories_id"
  end

  create_table "subcategories", force: :cascade do |t|
    t.string "title"
    t.string "image_uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "categories_id", null: false
    t.index ["categories_id"], name: "index_subcategories_on_categories_id"
  end

  add_foreign_key "basket_products", "baskets", column: "baskets_id"
  add_foreign_key "basket_products", "products", column: "products_id"
  add_foreign_key "baskets", "clients"
  add_foreign_key "orders", "clients"
  add_foreign_key "orders", "products", column: "basket_product_id"
  add_foreign_key "products", "subcategories", column: "subcategories_id"
  add_foreign_key "subcategories", "categories", column: "categories_id"
end
