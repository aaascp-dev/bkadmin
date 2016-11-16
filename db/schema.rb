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

ActiveRecord::Schema.define(version: 20161116051114) do

  create_table "addresses", force: :cascade do |t|
    t.string   "zip_code",     null: false
    t.string   "street"
    t.integer  "number"
    t.string   "complement"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["zip_code"], name: "index_addresses_on_zip_code"
  end

  create_table "beer_characteristics", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_beer_characteristics_on_name"
  end

  create_table "beer_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_beer_types_on_name"
  end

  create_table "beers", force: :cascade do |t|
    t.integer  "code"
    t.integer  "beer_type_id",                      null: false
    t.boolean  "is_imported",       default: false
    t.boolean  "is_better_quality", default: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["beer_type_id"], name: "index_beers_on_beer_type_id"
    t.index ["code"], name: "index_beers_on_code"
  end

  create_table "beers_beer_characteristics", id: false, force: :cascade do |t|
    t.integer "beer_id",                 null: false
    t.integer "beer_characteristics_id", null: false
    t.index ["beer_characteristics_id"], name: "index_beers_beer_characteristics_on_beer_characteristics_id"
    t.index ["beer_id", "beer_characteristics_id"], name: "index_beers_beer_characteristics", unique: true
    t.index ["beer_id"], name: "index_beers_beer_characteristics_on_beer_id"
  end

  create_table "clients", force: :cascade do |t|
    t.integer  "address_id", null: false
    t.string   "full_name",  null: false
    t.date     "birthdate"
    t.string   "email",      null: false
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_clients_on_address_id"
    t.index ["email"], name: "index_clients_on_email"
    t.index ["full_name"], name: "index_clients_on_full_name"
  end

  create_table "clients_restrictions", id: false, force: :cascade do |t|
    t.integer "client_id",      null: false
    t.integer "restriction_id", null: false
    t.index ["client_id", "restriction_id"], name: "index_clients_restrictions", unique: true
    t.index ["client_id"], name: "index_clients_restrictions_on_client_id"
    t.index ["restriction_id"], name: "index_clients_restrictions_on_restriction_id"
  end

  create_table "club_extras", force: :cascade do |t|
    t.integer  "club_id",    null: false
    t.string   "extra_type", null: false
    t.integer  "extra_id",   null: false
    t.integer  "client_id",  null: false
    t.text     "comments"
    t.integer  "quantity",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_club_extras_on_client_id"
    t.index ["club_id", "extra_id", "extra_type", "client_id"], name: "index_club_extra", unique: true
    t.index ["club_id"], name: "index_club_extras_on_club_id"
    t.index ["extra_type", "extra_id"], name: "index_club_extras_on_extra_type_and_extra_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.integer  "plan_id",    null: false
    t.date     "date",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_clubs_on_plan_id"
    t.index [nil, "date"], name: "index_clubs_on_plan_and_date", unique: true
  end

  create_table "clubs_products", force: :cascade do |t|
    t.integer  "club_id",    null: false
    t.integer  "product_id", null: false
    t.integer  "quantity",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id", "product_id"], name: "index_clubs_products_on_club_id_and_product_id", unique: true
    t.index ["club_id"], name: "index_clubs_products_on_club_id"
    t.index ["product_id"], name: "index_clubs_products_on_product_id"
  end

  create_table "glass_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_glass_types_on_name"
  end

  create_table "glasses", force: :cascade do |t|
    t.integer  "glass_type_id"
    t.string   "name",          null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["glass_type_id"], name: "index_glasses_on_glass_type_id"
    t.index ["name"], name: "index_glasses_on_name"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "client_id",  null: false
    t.date     "date",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_orders_on_client_id"
  end

  create_table "orders_products", force: :cascade do |t|
    t.integer  "order_id",   null: false
    t.integer  "product_id", null: false
    t.integer  "quantity",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id", "product_id"], name: "index_orders_products_on_order_id_and_product_id", unique: true
    t.index ["order_id"], name: "index_orders_products_on_order_id"
    t.index ["product_id"], name: "index_orders_products_on_product_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string   "name",                                null: false
    t.decimal  "price",      precision: 16, scale: 2, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["name"], name: "index_plans_on_name"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",                                null: false
    t.integer  "stock"
    t.decimal  "price",      precision: 16, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["name"], name: "index_products_on_name"
  end

  create_table "referrals", force: :cascade do |t|
    t.integer  "inviter_id",          null: false
    t.integer  "guest_id",            null: false
    t.date     "date",                null: false
    t.date     "bonus_delivery_date"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["guest_id"], name: "index_referrals_on_guest_id"
    t.index ["inviter_id", "guest_id"], name: "index_referrals", unique: true
    t.index ["inviter_id"], name: "index_referrals_on_inviter_id"
  end

  create_table "restrictions", force: :cascade do |t|
    t.string   "beer_restriction_type", null: false
    t.integer  "beer_restriction_id",   null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["beer_restriction_type", "beer_restriction_id"], name: "index_beer_restriction"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "client_id",           null: false
    t.integer  "plan_id",             null: false
    t.integer  "referral_id_id"
    t.date     "start_date",          null: false
    t.date     "end_date"
    t.text     "cancellation_reason"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["client_id", "plan_id", "start_date"], name: "index_subscription", unique: true
    t.index ["client_id"], name: "index_subscriptions_on_client_id"
    t.index ["plan_id"], name: "index_subscriptions_on_plan_id"
    t.index ["referral_id_id"], name: "index_subscriptions_on_referral_id_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
