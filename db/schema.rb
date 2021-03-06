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

ActiveRecord::Schema.define(:version => 20121101201851) do

  create_table "activity_types", :force => true do |t|
    t.string   "type_name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "activity_types_studies", :id => false, :force => true do |t|
    t.integer "activity_type_id"
    t.integer "study_id"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "findings", :force => true do |t|
    t.text     "content"
    t.integer  "study_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.boolean  "delta",      :default => true, :null => false
  end

  add_index "findings", ["study_id", "content"], :name => "index_findings_on_study_id_and_content"

  create_table "findings_tags", :id => false, :force => true do |t|
    t.integer "finding_id"
    t.integer "tag_id"
  end

  create_table "platforms", :force => true do |t|
    t.string   "platform_name"
    t.text     "description"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "platforms_studies", :id => false, :force => true do |t|
    t.integer "platform_id"
    t.integer "study_id"
  end

  create_table "products", :force => true do |t|
    t.string   "product_name"
    t.text     "description"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "products_studies", :id => false, :force => true do |t|
    t.integer "product_id"
    t.integer "study_id"
  end

  create_table "searches", :force => true do |t|
    t.string   "description"
    t.string   "product"
    t.string   "platform"
    t.string   "study"
    t.string   "tag"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "studies", :force => true do |t|
    t.string   "name"
    t.date     "date"
    t.text     "description"
    t.text     "participants"
    t.string   "presentation"
    t.string   "researcher"
    t.string   "designer"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.boolean  "delta",        :default => true,  :null => false
    t.boolean  "live",         :default => false
  end

  add_index "studies", ["created_at"], :name => "index_studies_on_created_at"
  add_index "studies", ["date"], :name => "index_studies_on_date"
  add_index "studies", ["name"], :name => "index_studies_on_name", :unique => true

  create_table "tags", :force => true do |t|
    t.string   "tag_name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
