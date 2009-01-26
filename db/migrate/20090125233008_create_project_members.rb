class CreateProjectMembers < ActiveRecord::Migration
  def self.up
    create_table :project_members do |t|
      t.integer :user_id, :project_id
      t.boolean :active, :default => true
      t.string :role, :skills
      t.timestamps
    end
    add_index :project_members, [:project_id, :user_id], :unique => true
    add_index :project_members, :user_id
  end

  def self.down
    remove_index :project_members, :user_id
    remove_index :project_members, :column => [:project_id, :user_id]
    drop_table :project_members
  end
end
