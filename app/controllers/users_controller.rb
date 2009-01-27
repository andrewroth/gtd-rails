class UsersController < ApplicationController
  before_filter :get_user, :only => [:show, :edit, :update]
  before_filter :check_permissions, :only => [:edit, :update]
  
  def show
  end
  # render new.rhtml
  def new
    @user = User.new
  end
  
  def edit
  end
  
  def update
    if params[:profile_picture] && params[:profile_picture][:uploaded_data].present?
      @user.profile_picture ? @user.profile_picture.update_attributes(params[:profile_picture]) : 
                                  @user.profile_picture = ProfilePicture.new(params[:profile_picture])
    end
    if @user.update_attributes(params[:user])
      respond_to do |wants|
        wants.html { redirect_to @user }
      end
    else
      respond_to do |wants|
        wants.html { render :action => :edit }
      end
    end
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end
  
  protected
    def get_user
      @user = User.find(params[:id])
    end
    
    def check_permissions
      unless @user == current_user
        redirect_to @user
        return false
      end
    end
end
