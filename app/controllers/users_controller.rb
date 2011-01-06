class UsersController < ApplicationController
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
  end
  
  def reset
    @title = "Reset Password"
  end

  def destroy
  end

end
