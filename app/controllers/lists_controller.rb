class ListsController < ApplicationController
  
  before_filter :require_login
  
  def index
    @title = "My Lists"
    @location = "lists"
    @lists = List.where(:user_id == current_user.id)
  end

  def new
    @title = "Create a New List"
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def add
  
  end
  
  def destroy
  end
  

end
