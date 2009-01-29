class Project < ActiveRecord::Base
  self.inheritance_column = 'false'
  belongs_to :creator, :class_name => "User", :foreign_key => "creator_id"
  has_many :project_members, :order => 'role desc, created_at', :dependent => :destroy
  has_many :users, :through => :project_members
  validates_presence_of :status, :skills_needed, :name, :purpose, :scope, :creator_id, 
                        :type, :resources_needed, :hosting_home, :estimated_days, :website,
                        :description, :is_seeking_volunteers, :active
  
  def seeking_volunteers_human
    is_seeking_volunteers? ? 'Yes' : 'No'
  end
  
  def hiring_human
    is_hiring? ? 'Yes' : 'No'
  end
  
end
