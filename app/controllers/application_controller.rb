class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  def login_require
      if session[:user]
        return true
      end
      flash[:warning]='Please login to continue'
      session[:return_to]=request.fullpath
      redirect_to login_path()
      return false 
    end

  def current_user
    session[:user]
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
