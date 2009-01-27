class CreateProfilePictures < ActiveRecord::Migration
  def self.up
    create_table :profile_pictures do |t|
      t.integer :user_id
      t.integer :parent_id, :size, :height, :width
      t.string :content_type, :filename, :thumbnail
      
      t.date :uploaded_date
    end
    add_index :profile_pictures, :user_id
  end

  def self.down
    drop_table :profile_pictures
  end
end
