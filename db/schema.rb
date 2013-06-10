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

ActiveRecord::Schema.define(:version => 20130509133203) do

  create_table "comments", :force => true do |t|
    t.integer  "postid"
    t.string   "text"
    t.string   "user"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "rating",      :default => 0
    t.text     "users_voted", :default => "-1", :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "user"
    t.string   "title"
    t.string   "text"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.text     "tags",        :default => "tag",   :null => false
    t.integer  "rating",      :default => 0,       :null => false
    t.text     "users_voted", :default => "admin", :null => false
  end

  create_table "users", :force => true do |t|
    t.integer  "rating",      :default => 0
    t.string   "name"
    t.string   "surname"
    t.string   "username"
    t.string   "password"
    t.string   "favorites"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.text     "users_voted", :default => "-1", :null => false
  end

end
