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

ActiveRecord::Schema.define(:version => 20110613231521) do

  create_table "application_forms", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "trading_name"
    t.string   "contact_name"
    t.string   "physical_address_1"
    t.string   "physical_address_2"
    t.string   "physical_address_3"
    t.string   "physical_postcode"
    t.string   "postal_address_1"
    t.string   "postal_address_2"
    t.string   "postal_address_3"
    t.string   "postal_postcode"
    t.string   "industry"
    t.string   "contact_business"
    t.string   "contact_toll_free"
    t.string   "contact_facsimile"
    t.string   "contact_home"
    t.string   "contact_mobile"
    t.string   "contact_email"
    t.string   "gst_number_1"
    t.string   "accountant_name"
    t.string   "accountant_address_1"
    t.string   "accountant_address_2"
    t.string   "accountant_partner"
    t.string   "accountant_phone"
    t.string   "accountant_email"
    t.string   "legal_name"
    t.string   "bartercard_account"
    t.string   "bartercard_name"
    t.string   "gst_number_2"
    t.string   "gst_number_3"
    t.string   "notes"
    t.string   "status"
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
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
