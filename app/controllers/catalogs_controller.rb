class CatalogsController < ApplicationController
  
  before_filter :require_admin
  
  def index
    @title = "Catalog Management"
    
    @location = "admin"
    @sub_location = "catalogs"

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
