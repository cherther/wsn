class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  def require_login
    if signed_in?
      return true
    end
    flash[:warning]='Please login to continue'
    session[:return_to]=request.fullpath
    redirect_to login_path()
    return false 
  end
  
  def require_admin
    if signed_in? && current_user.admin?
      return true
    end
    flash[:warning]='Please login to continue'
    session[:return_to]=request.fullpath
    redirect_to login_path()
    return false 
  end
#  def current_user
#    logger.info '!!!!in ApplicationController current user'
#    session[:user]
#    
#  end

  def redirect_to_stored
    if return_to = session[:return_to]
      session[:return_to]=nil
      redirect_to return_to
    else
      redirect_to root_path()
    end
  end
end
