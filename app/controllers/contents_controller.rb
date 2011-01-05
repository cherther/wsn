class ContentsController < ApplicationController
  def show
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
    
    @contents = Content.search(params, @page)
    @pages =  @contents.nil? ? 0 : Integer(@contents.count/@page_size)+1

    @styles = Tag.styles 
    @moods = Tag.moods		
  
  end
  

end
