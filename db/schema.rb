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
    t.boolean   "active",                                  :default => true, :null => false
    t.string    "name",                :limit => 45,                         :null => false
    t.string    "purpose"
    t.text      "description"
    t.string    "website"
    t.string    "creator",             :limit => 100,                        :null => false
    t.timestamp "created",                                                   :null => false
    t.text      "skillsneeded",        :limit => 16777215,                   :null => false
    t.integer   "estimateddays",                                             :null => false
    t.string    "status",                                                    :null => false
    t.string    "scope",               :limit => 0,                          :null => false
    t.text      "resourcesneeded",     :limit => 16777215,                   :null => false
    t.string    "isseekingvolunteers", :limit => 1,        :default => "N",  :null => false
    t.string    "ishiring",            :limit => 1,        :default => "N",  :null => false
    t.string    "type",                :limit => 0,                          :null => false
    t.string    "hostinghome",         :limit => 0,                          :null => false
  end

  add_index "project", ["description", "skillsneeded", "resourcesneeded"], :name => "description"

  create_table "project_member", :force => true do |t|
    t.string    "guid",    :limit => 100,                       :null => false
    t.integer   "pid",                                          :null => false
    t.boolean   "active",                 :default => true,     :null => false
    t.string    "role",    :limit => 45,  :default => "Member", :null => false
    t.text      "skills"
    t.timestamp "created",                                      :null => false
  end

  create_table "user", :force => true do |t|
    t.boolean   "active",                             :default => true, :null => false
    t.string    "guid",           :limit => 100,                        :null => false
    t.string    "email",          :limit => 45,                         :null => false
    t.string    "first",          :limit => 45,                         :null => false
    t.string    "last",           :limit => 45,                         :null => false
    t.timestamp "created",                                              :null => false
    t.text      "bio",            :limit => 16777215,                   :null => false
    t.string    "profilepicture",                                       :null => false
    t.text      "skillkeywords",  :limit => 16777215,                   :null => false
  end

end
