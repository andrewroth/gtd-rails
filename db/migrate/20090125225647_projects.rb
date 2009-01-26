class Projects < ActiveRecord::Migration
  def self.up
    create_table "projects", :force => true do |t|
      t.boolean :active, :is_seeking_volunteers, :default => 1
      t.boolean :is_hiring, :default => 0
      t.string :name, :purpose, :website, :type, :status, :scope, :hosting_home, :limit => 500
      t.text :description, :skills_needed, :resources_needed
      t.integer :creator_id, :estimated_days
      t.timestamps
    end
  end

  def self.down
    drop_table "projects"
  end
end
