class UsersController < ApplicationController
  
  before_filter :require_login, :except => [:new, :create, :reset ]
  
  def index
    @title = "User Management"
    @location = "admin"
    @sub_location = "users"
    @users = User.list
  end

  def invite
    @location = "admin"
    @sub_location = "users_invite"
  end

  def new
    @title = "Register"
    @location = "register"
  end

  def create
  end

  def show
    @user = User.find(params[:id])
    @location = "admin"
    @sub_location = "users"
    @title = "User Detail"
    
  end

  def edit
    @user = User.find(params[:id])
    @location = "admin"
    @sub_location = "users"
    @title = "User Profile"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
#      redirect_to @user
      render 'edit'
    else
      @location = "admin"
      @sub_location = "users"
      @title = "User Profile"
      render 'edit'
    end
  end
  
  def reset
    @title = "Reset Password"
  end

  def destroy
  end

end
