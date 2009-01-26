class Project < ActiveRecord::Base
  self.inheritance_column = 'false'
  belongs_to :creator, :class_name => "User", :foreign_key => "creator_id"
  has_many :project_members, :order => 'role desc'
  has_many :users, :through => :project_members
  
  def seeking_volunteers_human
    is_seeking_volunteers? ? 'Yes' : 'No'
  end
  
  def hiring_human
    is_hiring? ? 'Yes' : 'No'
  end
  
end
