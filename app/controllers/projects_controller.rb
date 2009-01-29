class ProjectsController < ApplicationController
  before_filter :login_required, :only => [ :new, :create, :edit ]
  before_filter :get_project, :only => [ :show, :edit, :update, :destroy ]
  before_filter :get_projects, :only => [ :index, :show, :new ]
  before_filter :set_project_ownership, :only => [ :show, :edit, :update ]
  before_filter :ensure_project_ownership, :only => [ :update ]

  # GET /projects
  # GET /projects.xml
  def index
    @project = @projects.first
    @index = @projects.index(@project)
    respond_to do |format|
      format.html { render :action => :show }
      format.xml  { render :xml => @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @index = @projects.index(@project)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.xml
  def create
    @project = Project.new(params[:project])
    @project.creator = current_user

    respond_to do |format|
      if @project.save
        flash[:notice] = 'Project was successfully created.'
        format.html { redirect_to(@project) }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    respond_to do |format|
      if @project.update_attributes(params[:project])
        flash[:notice] = 'Project was successfully updated.'
        format.html { redirect_to(@project) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.xml  { head :ok }
    end
  end

  protected

    def get_project() @project = Project.find(params[:id]) end
    def get_projects() @projects = Project.find(:all, :order => "created_at desc") end
    def set_project_ownership() @owner = self.current_user == @project.creator end
    def ensure_project_ownership() flash[:notice] = "You don't have permission."; redirect_to projects_url unless @owner end
end
