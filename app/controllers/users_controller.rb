class UsersController < ApplicationController
  
  before_filter :require_admin, :only => [:index]
  before_filter :require_parent_or_plan_user_admin, :only => [:show, :edit, :update, :destroy ]

  def index
    @title = "User Management"
    @location = "admin"
    @sub_location = "users"
    @users = User.list
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

  private
    def require_current_user
      if signed_in? && current_user.admin?
        return true
      else
        @user = User.find(params[:id])
        deny_access unless signed_in? && current_user?(@user)      
      end
    end
  
    def require_parent_or_plan_user_admin
      if signed_in? && current_user.super_admin?
        return true
      else  
        @user = User.find(params[:id])
        deny_access unless signed_in? && current_user_can_modify?(@user)
      end
    end
  
    def current_user_can_modify?(user)
        return current_user?(@user) || 
        (current_user.admin? && 
          (
            current_user?(@user.parent_user) || 
            current_user?(@user.plan_user)
          )
        )
    end

  
  
end
