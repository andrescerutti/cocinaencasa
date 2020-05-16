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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_16_034401) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.string "flat_number"
    t.string "state"
    t.string "cp"
    t.string "street"
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.string "operator"
    t.integer "last_four"
    t.string "valid_thru"
    t.string "name_in_card"
    t.string "logo"
    t.string "doc_type"
    t.string "doc_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "cookwares", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favourites", force: :cascade do |t|
    t.bigint "kit_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kit_id"], name: "index_favourites_on_kit_id"
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "guides", force: :cascade do |t|
    t.string "video"
    t.bigint "kit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kit_id"], name: "index_guides_on_kit_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kit_categories", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "kit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_kit_categories_on_category_id"
    t.index ["kit_id"], name: "index_kit_categories_on_kit_id"
  end

  create_table "kit_cookwares", force: :cascade do |t|
    t.bigint "cookware_id"
    t.bigint "kit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cookware_id"], name: "index_kit_cookwares_on_cookware_id"
    t.index ["kit_id"], name: "index_kit_cookwares_on_kit_id"
  end

  create_table "kit_ingredients", force: :cascade do |t|
    t.bigint "ingredient_id"
    t.bigint "kit_id"
    t.float "quantity"
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_kit_ingredients_on_ingredient_id"
    t.index ["kit_id"], name: "index_kit_ingredients_on_kit_id"
  end

  create_table "kits", force: :cascade do |t|
    t.string "name"
    t.integer "stock"
    t.integer "price"
    t.integer "size"
    t.string "preparation_time"
    t.string "image"
    t.text "description"
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "priority", default: 0
    t.string "tags", default: ""
    t.string "difficulty", default: ""
    t.string "slug"
    t.index ["restaurant_id"], name: "index_kits_on_restaurant_id"
    t.index ["slug"], name: "index_kits_on_slug", unique: true
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "kit_id"
    t.bigint "user_id"
    t.string "check_out_session_id"
    t.integer "amount"
    t.boolean "state", default: false
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.string "delivery_provider"
    t.datetime "date_delivery"
    t.integer "status", default: 0
    t.string "reference_number"
    t.string "reason"
    t.boolean "paid_delivery", default: false
    t.string "comment"
    t.integer "store_id"
    t.index ["addressable_type", "addressable_id"], name: "index_orders_on_addressable_type_and_addressable_id"
    t.index ["kit_id"], name: "index_orders_on_kit_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "approved", default: false
    t.boolean "cash", default: false
    t.string "status"
    t.string "external_id"
    t.string "date_approved"
    t.string "operation_type"
    t.string "payment_method_id"
    t.string "payment_type_id"
    t.string "status_detail"
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "brand_id"
    t.string "name"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "phone"
    t.text "test_mp_public_key_ciphertext"
    t.text "test_mp_private_key_ciphertext"
    t.text "prod_mp_public_key_ciphertext"
    t.text "prod_mp_private_key_ciphertext"
    t.boolean "own_delivery", default: false
    t.string "day_open"
    t.string "emoji"
    t.string "hq_address"
    t.string "slug"
    t.string "description", default: ""
    t.index ["brand_id"], name: "index_restaurants_on_brand_id"
    t.index ["slug"], name: "index_restaurants_on_slug", unique: true
    t.index ["user_id"], name: "index_restaurants_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "order_id"
    t.text "content"
    t.integer "rating"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_reviews_on_order_id"
  end

  create_table "steps", force: :cascade do |t|
    t.integer "order"
    t.text "content"
    t.bigint "guide_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guide_id"], name: "index_steps_on_guide_id"
  end

  create_table "stores", force: :cascade do |t|
    t.bigint "restaurant_id"
    t.string "name"
    t.boolean "sunday", default: true
    t.boolean "monday", default: true
    t.boolean "tuesday", default: true
    t.boolean "wednesday", default: true
    t.boolean "thursday", default: true
    t.boolean "friday", default: true
    t.boolean "saturday", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.float "next_day_hour", default: 0.0
    t.float "day_for_order", default: 0.0
    t.string "flags", default: ""
    t.boolean "pick_up", default: false
    t.text "polygon", default: "[]"
    t.boolean "accepts_cash", default: false
    t.index ["addressable_type", "addressable_id"], name: "index_stores_on_addressable_type_and_addressable_id"
    t.index ["restaurant_id"], name: "index_stores_on_restaurant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "avatar_image"
    t.integer "permision_level", default: 1
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.string "mpcard_id"
    t.string "mpcustomer_id"
    t.string "phone"
    t.index ["addressable_type", "addressable_id"], name: "index_users_on_addressable_type_and_addressable_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cards", "users"
  add_foreign_key "favourites", "kits"
  add_foreign_key "favourites", "users"
  add_foreign_key "guides", "kits"
  add_foreign_key "kit_categories", "categories"
  add_foreign_key "kit_categories", "kits"
  add_foreign_key "kit_cookwares", "cookwares"
  add_foreign_key "kit_cookwares", "kits"
  add_foreign_key "kit_ingredients", "ingredients"
  add_foreign_key "kit_ingredients", "kits"
  add_foreign_key "kits", "restaurants"
  add_foreign_key "orders", "kits"
  add_foreign_key "orders", "users"
  add_foreign_key "payments", "orders"
  add_foreign_key "restaurants", "brands"
  add_foreign_key "restaurants", "users"
  add_foreign_key "reviews", "orders"
  add_foreign_key "steps", "guides"
  add_foreign_key "stores", "restaurants"
end
