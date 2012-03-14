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

ActiveRecord::Schema.define(:version => 20120314174614) do

  create_table "followings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "presentation_id"
    t.integer  "guest_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "contact_id"
  end

  add_index "followings", ["contact_id"], :name => "index_followings_on_contact_id"
  add_index "followings", ["guest_id"], :name => "index_followings_on_guest_id"
  add_index "followings", ["presentation_id"], :name => "index_followings_on_presentation_id"
  add_index "followings", ["user_id"], :name => "index_followings_on_user_id"

  create_table "guest_translations", :force => true do |t|
    t.integer  "guest_id"
    t.string   "locale"
    t.text     "bio"
    t.text     "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "guest_translations", ["guest_id"], :name => "index_guest_translations_on_guest_id"
  add_index "guest_translations", ["locale"], :name => "index_guest_translations_on_locale"

  create_table "guests", :force => true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "datatype"
    t.text     "title"
    t.text     "bio"
    t.string   "picture"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "presentation_translations", :force => true do |t|
    t.integer  "presentation_id"
    t.string   "locale"
    t.text     "content"
    t.string   "title"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "presentation_translations", ["locale"], :name => "index_presentation_translations_on_locale"
  add_index "presentation_translations", ["presentation_id"], :name => "index_06a75948c1ee24280e31c12b5a2944f03508c134"

  create_table "presentations", :force => true do |t|
    t.string   "title"
    t.string   "datatype"
    t.text     "content"
    t.string   "venue"
    t.date     "date"
    t.time     "time"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "presentations", ["datatype"], :name => "index_presentations_on_datatype"
  add_index "presentations", ["date"], :name => "index_presentations_on_date"
  add_index "presentations", ["time"], :name => "index_presentations_on_time"

  create_table "sessions", :force => true do |t|
    t.integer  "guest_id"
    t.integer  "presentation_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "sessions", ["guest_id"], :name => "index_sessions_on_guest_id"
  add_index "sessions", ["presentation_id"], :name => "index_sessions_on_presentation_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "last_name"
    t.string   "first_name"
    t.boolean  "gender"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.boolean  "is_admin",           :default => false
    t.string   "title"
    t.string   "fb_username"
    t.boolean  "is_member",          :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["is_member"], :name => "index_users_on_is_member"

end
