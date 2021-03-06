class UsersController < ApplicationController
  def index
    @title = "User Management"
    @location = "admin"
    @sub_location = "users"
    @users = User.order('parent_user_id, role_id, pricing_plan_id desc, user_name').all
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
