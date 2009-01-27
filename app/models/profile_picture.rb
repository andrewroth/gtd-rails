class ProfilePicture < ActiveRecord::Base
  belongs_to :user
  
  has_attachment :content_type => :image, 
                 :storage => :s3, 
                 :max_size => 10.megabytes,
                 :resize_to => '400x400>',
                 :thumbnails => {:mini => '50x50>',
                                 :thumb => '100x100>',
                                 :medium => '200x200>' }
                                 
  validates_as_attachment
end
