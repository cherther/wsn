class CatalogsController < ApplicationController
  
  before_filter :require_admin
  
  def index
    @title = "Catalog Management"
    
    @location = "admin"
    @sub_location = "catalogs"

    @page_size = 50
    @page = params[:page].blank? ? 1 : Integer(params[:page])   
    
    @pages =  @contents.nil? ? 0 : Integer(@contents.count/@page_size)+1

    @contents = Content.list_recent(@page, current_user)

  end

  def show
    @title = "Catalog Management"
    @location = "admin"
    @sub_location = "catalogs"
  end

  def edit
    @title = "Catalog Management"
    @location = "admin"
    @sub_location = "catalogs"
  end

  def update
  end

  def destroy
  end

  def upload
    @title = "Catalog Upload"
    @location = "admin"
    @sub_location = "catalogs_upload"
  end

end
