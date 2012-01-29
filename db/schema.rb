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

ActiveRecord::Schema.define(:version => 20120124141805) do

  create_table "keynotes", :force => true do |t|
    t.text     "title",      :limit => 1024, :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "sessions", :force => true do |t|
    t.integer  "speaker_id", :null => false
    t.integer  "keynote_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["keynote_id"], :name => "index_sessions_on_keynote_id"
  add_index "sessions", ["speaker_id"], :name => "index_sessions_on_speaker_id"

  create_table "speakers", :force => true do |t|
    t.string   "last_name",                  :null => false
    t.string   "first_name",                 :null => false
    t.text     "title",      :limit => 1024, :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",              :null => false
    t.string   "encrypted_password", :null => false
    t.string   "salt",               :null => false
    t.string   "last_name",          :null => false
    t.string   "first_name",         :null => false
    t.boolean  "gender"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
