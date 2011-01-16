class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  def require_login
    deny_access unless signed_in? 
  end
  
  def require_admin
    deny_access unless signed_in? && current_user.admin?
  end

  def redirect_to_stored
    if return_to = session[:return_to]
      session[:return_to]=nil
      redirect_to return_to
    else
      redirect_to root_path()
    end
  end
  
    
end
