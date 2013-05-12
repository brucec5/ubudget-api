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

ActiveRecord::Schema.define(:version => 20130511235107) do

  create_table "budgets", :force => true do |t|
    t.integer  "user_id"
    t.string   "budget_name"
    t.integer  "amount"
    t.integer  "amount_so_far",       :default => 0
    t.boolean  "recur"
    t.date     "start_date"
    t.string   "recurrence_duration"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "other_duration"
  end

  create_table "entries", :force => true do |t|
    t.integer  "budget_id"
    t.integer  "amount"
    t.text     "notes"
    t.date     "expenditure_date"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
  end

end
