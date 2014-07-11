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
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20140710141325) do
=======
ActiveRecord::Schema.define(version: 20140711045850) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "tags"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
>>>>>>> b626560457cacb12f365c45d56c329e8bdc5af21

  create_table "blogs", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "tags"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "code_snippets", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "tags"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "tags"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
