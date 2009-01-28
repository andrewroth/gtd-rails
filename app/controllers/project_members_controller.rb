class ProjectMembersController < ApplicationController
  before_filter :login_required
  before_filter :get_project
  
  def new
    @project_member = @project.project_members.new
  end
  
  def create
    unless@project.users.include?(current_user)
      @project.project_members.create(:user_id => current_user.id, :skills => params[:skills], :role => 'Member')
    end
    redirect_to(@project)
  end
  
  def destroy
    @project_member = ProjectMember.find(params[:id])
    @project_member.destroy if (current_user == @project.creator || current_user == @project_member.user) && @project_member.role != 'Owner'
    redirect_to(@project)
  end
  
  protected
  def get_project
    @project = Project.find(params[:project_id])
  end
end
