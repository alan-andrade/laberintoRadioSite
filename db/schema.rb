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

ActiveRecord::Schema.define(:version => 20120807044828) do

  create_table "profiles", :force => true do |t|
    t.integer "user_id"
    t.string  "name",     :default => "Sin nombre", :null => false
    t.string  "nickname", :default => "",           :null => false
  end

  add_index "profiles", ["user_id"], :name => "users_profile_index"

  create_table "programs", :force => true do |t|
    t.integer "user_id",                                        :null => false
    t.string  "name",        :default => "Programa sin nombre"
    t.text    "description"
  end

  add_index "programs", ["user_id"], :name => "index_programs_on_user_id"

  create_table "users", :force => true do |t|
    t.string  "email",                                  :null => false
    t.string  "crypted_password",                       :null => false
    t.string  "password_salt",                          :null => false
    t.string  "persistence_token",                      :null => false
    t.string  "single_access_token",                    :null => false
    t.string  "perishable_token",                       :null => false
    t.boolean "admin",               :default => false
  end

end
