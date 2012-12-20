# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20121219222747) do

  create_table "attachments", :force => true do |t|
    t.string   "file"
    t.string   "url"
    t.string   "title"
    t.string   "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "post_id"
  end

  create_table "notes", :force => true do |t|
    t.string   "post_id"
    t.string   "user_id"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "message"
    t.integer  "user_id"
    t.boolean  "private"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "project_id"
    t.string   "phase"
    t.string   "attachment"
    t.string   "url"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.boolean  "active"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "current_phase"
    t.datetime "post_last_updated"
  end

  create_table "steps", :force => true do |t|
    t.string   "name"
    t.integer  "completion"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "onboarding_id"
    t.integer  "creative_id"
  end

  create_table "subposts", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.string   "file"
    t.integer  "post_id"
    t.string   "url"
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "avatar"
    t.integer  "project_id"
  end

end
