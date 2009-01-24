class ProjectMembersController < ApplicationController
  # GET /project_members
  # GET /project_members.xml
  def index
    @project_members = ProjectMember.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @project_members }
    end
  end

  # GET /project_members/1
  # GET /project_members/1.xml
  def show
    @project_member = ProjectMember.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project_member }
    end
  end

  # GET /project_members/new
  # GET /project_members/new.xml
  def new
    @project_member = ProjectMember.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project_member }
    end
  end

  # GET /project_members/1/edit
  def edit
    @project_member = ProjectMember.find(params[:id])
  end

  # POST /project_members
  # POST /project_members.xml
  def create
    @project_member = ProjectMember.new(params[:project_member])

    respond_to do |format|
      if @project_member.save
        flash[:notice] = 'ProjectMember was successfully created.'
        format.html { redirect_to(@project_member) }
        format.xml  { render :xml => @project_member, :status => :created, :location => @project_member }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project_member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /project_members/1
  # PUT /project_members/1.xml
  def update
    @project_member = ProjectMember.find(params[:id])

    respond_to do |format|
      if @project_member.update_attributes(params[:project_member])
        flash[:notice] = 'ProjectMember was successfully updated.'
        format.html { redirect_to(@project_member) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project_member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /project_members/1
  # DELETE /project_members/1.xml
  def destroy
    @project_member = ProjectMember.find(params[:id])
    @project_member.destroy

    respond_to do |format|
      format.html { redirect_to(project_members_url) }
      format.xml  { head :ok }
    end
  end
end
