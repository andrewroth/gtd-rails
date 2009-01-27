# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController

  # render new.rhtml
  def new    
    if logged_in?
      redirect_back_or_default(user_path(self.current_user))
    end
  end

  def create
    form_params = {:username => params[:username], :password => params[:password], :service => new_session_url }
    cas_url = 'https://signin.mygcx.org/cas/login'
    agent = WWW::Mechanize.new
    page = agent.post(cas_url, form_params)
    result_query = page.uri.query
    unless result_query && result_query.include?('BadPassword')
      flash[:notice] = "Logged in successfully"
      redirect_to(cas_url + '?service=' + new_session_url + '&username=' + params[:username] + '&password=' + params[:password])
      return
    else
      note_failed_signin
      @login       = params[:login]
      @remember_me = params[:remember_me]
      render :action => 'new'
    end
  end

  def destroy
    logout_killing_session!
    flash[:notice] = "You have been logged out."
  end

protected
  # Track failed login attempts
  def note_failed_signin
    flash[:error] = "Couldn't log you in as '#{params[:login]}'"
    logger.warn "Failed login for '#{params[:login]}' from #{request.remote_ip} at #{Time.now.utc}"
  end
end
