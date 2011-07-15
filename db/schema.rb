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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110711014351) do

  create_table "accountants", :force => true do |t|
    t.string   "name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "partner"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "application_form_id"
  end

  create_table "addresses", :force => true do |t|
    t.integer  "application_form_id"
    t.string   "address_type"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "address_3"
    t.string   "postcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "application_forms", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "notes"
    t.string   "status"
    t.integer  "entity_id"
    t.string   "form_type"
    t.decimal  "set_up_hours"
    t.decimal  "set_up_rate"
    t.decimal  "data_entry_hours"
    t.decimal  "data_entry_rate"
    t.decimal  "travel_cost"
    t.boolean  "sent_priced_email"
  end

  create_table "bank_accounts", :force => true do |t|
    t.string   "bank"
    t.string   "branch"
    t.string   "account"
    t.string   "suffix"
    t.integer  "application_form_id"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "needs_cheques"
    t.boolean  "pays_subscription"
    t.integer  "number_of_transactions"
  end

  create_table "bartercards", :force => true do |t|
    t.string   "name"
    t.string   "account_1"
    t.string   "account_2"
    t.string   "account_3"
    t.string   "account_4"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "application_form_id"
    t.integer  "number_of_transactions"
  end

  create_table "contact_people", :force => true do |t|
    t.string   "business_phone"
    t.string   "toll_free_phone"
    t.string   "facsimile"
    t.string   "home_phone"
    t.string   "mobile_phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "application_form_id"
  end

  create_table "credit_cards", :force => true do |t|
    t.integer  "application_form_id"
    t.string   "name"
    t.string   "account_1"
    t.string   "account_2"
    t.string   "account_3"
    t.string   "account_4"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number_of_transactions"
  end

  create_table "entities", :force => true do |t|
    t.integer  "user_id"
    t.string   "legal_name"
    t.string   "trading_name"
    t.string   "industry"
    t.string   "gst_number_1"
    t.string   "gst_number_2"
    t.string   "gst_number_3"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "abn_number"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "admin"
    t.boolean  "associate"
    t.integer  "associate_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
