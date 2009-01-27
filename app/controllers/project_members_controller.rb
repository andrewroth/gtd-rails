class ProjectMembersController < ApplicationController
  before_filter :login_required
  before_filter :get_project
  
  def new
    @project_member = @project.project_members.new
  end
  
  protected
  def get_project
    @project = Project.find(params[:project_id])
  end
end
