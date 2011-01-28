class ContentsController < ApplicationController
  
  before_filter :require_login
  before_filter :require_admin, :only => [ :edit, :destroy ]
  
  def show
    content_id = params[:id].to_i unless params[:id].blank?
    @contents = Content.detail(content_id, current_user)
  end

  def edit
  end

  def destroy
  end
  
  def search
    @location = "search"
    @title = "Search"
    
    @styles = Tag.styles
    @moods = Tag.moods
  end

  def results    
    
    @location = "search"
    @title = "Search"
    
    @page_size = 50
    @page = params[:page].blank? ? 1 : Integer(params[:page])   
    offset = @page * @page_size
    
    #sort = params[:so]
    #sort_by = params[:sd]
    
    @contents = Content.search(params, @page, current_user)
    @pages =  @contents.nil? ? 0 : Integer(@contents.count/@page_size)+1

    @styles = Tag.styles 
    @moods = Tag.moods		
  
  end
  

end
