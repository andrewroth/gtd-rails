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

ActiveRecord::Schema.define(:version => 20090125233008) do

  create_table "profile_pictures", :force => true do |t|
    t.integer "user_id"
    t.integer "parent_id"
    t.integer "size"
    t.integer "height"
    t.integer "width"
    t.string  "content_type"
    t.string  "filename"
    t.string  "thumbnail"
    t.date    "uploaded_date"
  end

  add_index "profile_pictures", ["user_id"], :name => "index_profile_pictures_on_user_id"

  create_table "project_members", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.boolean  "active",     :default => true
    t.string   "role"
    t.string   "skills"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_members", ["project_id", "user_id"], :name => "index_project_members_on_project_id_and_user_id", :unique => true
  add_index "project_members", ["user_id"], :name => "index_project_members_on_user_id"

  create_table "projects", :force => true do |t|
    t.boolean  "active",                               :default => true
    t.boolean  "is_seeking_volunteers",                :default => true
    t.boolean  "is_hiring",                            :default => false
    t.string   "name",                  :limit => 500
    t.string   "purpose",               :limit => 500
    t.string   "website",               :limit => 500
    t.string   "type",                  :limit => 500
    t.string   "status",                :limit => 500
    t.string   "scope",                 :limit => 500
    t.string   "hosting_home",          :limit => 500
    t.text     "description"
    t.text     "skills_needed"
    t.text     "resources_needed"
    t.integer  "creator_id"
    t.integer  "estimated_days"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "first",                     :limit => 100,  :default => ""
    t.string   "last",                      :limit => 100,  :default => ""
    t.string   "email",                     :limit => 100
    t.string   "guid",                      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.boolean  "active",                                    :default => true
    t.text     "bio"
    t.string   "skillkeywords",             :limit => 2000, :default => ""
    t.string   "profilepicture"
  end

  add_index "users", ["guid"], :name => "index_users_on_guid", :unique => true

end
