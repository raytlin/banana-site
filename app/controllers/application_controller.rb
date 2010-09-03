# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

private #--------------------------------------------------
  
  def authorize_access
    unless session[:admin_user_id]
    flash[:notice] = 'please log in'
    redirect_to(:controller => 'admin', :action => 'index')
    return false 
    end
  end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
