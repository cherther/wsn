require 'spec_helper'

describe Content do

  describe "detail for a user with privileges" do
    
    before(:each) do
      @content_id = 8080
      @user = existing_user
      @user.id = 2
    end
    
    it " should return correct content by id" do
      content = Content.detail(@content_id, @user)
      content.should_not be_nil
      content.id.should be @content_id
    end
    
    it " should include the catalog" do
      content = Content.detail(@content_id, @user)
      content.catalog.should_not be_nil
      content.catalog.id.should be > 0
    end
    
    it " should include any media file(s)" do
      content = Content.detail(@content_id, @user)
      content.media_files.should_not be_nil
      content.media_files.count.should be > 0
    end
    
    it " should include the representation information" do
      content = Content.detail(@content_id, @user)
      content.representations.should_not be_nil
      content.representations.count.should be > 0
    end
    
  end
  
  describe "detail for a user without privileges" do
    
    before(:each) do
      @content_id = 8080
      @user = existing_user
    end
    
    it " should not return any content" do
      content = Content.detail(@content_id, @user)
      content.should be_nil
    end
  
  end

  describe "search" do

    before(:each) do
      @params = {:keyword => "love"}
      @user = existing_user
      @user.id = 2
    end

    it "should return search results" do
      results = Content.search(@params, 1, @user)
      results.should_not be_nil
      results.count.should be > 0
    end
  
    it "should return one page at a time" do
      results = Content.search(@params, 1, @user)
      results.length.should be results.per_page
    end

    it "should paginate" do
      page = 2
      results = Content.search(@params, page, @user)
      results.current_page.should be page
    end

  end

end