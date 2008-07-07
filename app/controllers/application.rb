# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '9045e62373e46f20e6f930403508a85d'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  def deny_banned
    if Ban.find(:first,:conditions => ['banned_ip = ? ',request.remote_ip])
      redirect_to '/banned.html'
    end
  end
  
  def check_auth
    if session[:admin]
    else
      redirect_to :action => :login, :controller => :admin
    end
  end
  
end
