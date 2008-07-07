# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080702060742) do

  create_table "bans", :force => true do |t|
    t.string   "banned_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_versions", :force => true do |t|
    t.integer  "page_id",    :limit => 11
    t.integer  "version",    :limit => 11
    t.string   "name"
    t.string   "permalink"
    t.text     "content"
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "name",                     :null => false
    t.string   "permalink",                :null => false
    t.text     "content"
    t.string   "author",                   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",    :limit => 11
  end

end
