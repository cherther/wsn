class SessionsController < ApplicationController
  def new
    @title = "Log In"
  end

  def create
    user = User.authenticate(params[:session][:user_name],
                                 params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Log In"
      render 'new'
    else
      sign_in user
      redirect_to root_path()
    end
    
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
