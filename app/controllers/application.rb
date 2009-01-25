# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  before_filter CASClient::Frameworks::Rails::GatewayFilter, :login_from_cas unless Rails.env.test?

  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '58a9aa220ab810d94bfe29227dbb89d5'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  filter_parameter_logging :password
  
  def login_from_cas
    cas_user = session[:cas_user]
    u = false
    if cas_user
      u = User.find_or_create_from_cas(session[:cas_last_valid_ticket])
      self.current_user = u
    end
  end
end
