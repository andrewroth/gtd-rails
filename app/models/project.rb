class Project < ActiveRecord::Base
  set_table_name 'project'
  self.inheritance_column = 'false'
end
