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

ActiveRecord::Schema.define(:version => 0) do

  create_table "project", :force => true do |t|
    t.boolean   "active",                                  :default => true, :null => true
    t.string    "name",                :limit => 45,                         :null => true
    t.string    "purpose"
    t.text      "description"
    t.string    "website"
    t.string    "creator",             :limit => 100,                        :null => true
    t.timestamp "created",                                                   :null => true
    t.text      "skillsneeded",        :limit => 16777215,                   :null => true
    t.integer   "estimateddays",                                             :null => true
    t.string    "status",                                                    :null => true
    t.string    "scope",               :limit => 0,                          :null => true
    t.text      "resourcesneeded",     :limit => 16777215,                   :null => true
    t.string    "isseekingvolunteers", :limit => 1,        :default => "N",  :null => true
    t.string    "ishiring",            :limit => 1,        :default => "N",  :null => true
    t.string    "type",                :limit => 0,                          :null => true
    t.string    "hostinghome",         :limit => 0,                          :null => true
  end

  add_index "project", ["description", "skillsneeded", "resourcesneeded"], :name => "description"

  create_table "project_member", :force => true do |t|
    t.string    "guid",    :limit => 100,                       :null => true
    t.integer   "pid",                                          :null => true
    t.boolean   "active",                 :default => true,     :null => true
    t.string    "role",    :limit => 45,  :default => "Member", :null => true
    t.text      "skills"
    t.timestamp "created",                                      :null => true
  end

  create_table "user", :force => true do |t|
    t.boolean   "active",                             :default => true, :null => true
    t.string    "guid",           :limit => 100,                        :null => true
    t.string    "email",          :limit => 45,                         :null => true
    t.string    "first",          :limit => 45,                         :null => true
    t.string    "last",           :limit => 45,                         :null => true
    t.timestamp "created",                                              :null => true
    t.text      "bio",            :limit => 16777215,                   :null => true
    t.string    "profilepicture",                                       :null => true
    t.text      "skillkeywords",  :limit => 16777215,                   :null => true
  end

end
