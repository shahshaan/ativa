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

ActiveRecord::Schema.define(:version => 20121203172807) do

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

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "avatar"
  end

end
