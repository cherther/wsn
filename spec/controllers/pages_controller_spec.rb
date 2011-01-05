require 'spec_helper'

describe PagesController do
  render_views
  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'home'
      response.should have_selector("title", :content => " | Home" )
    end

  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
    it "should have the right title" do
      get 'contact'
      response.should have_selector("title", :content => " | Contact Us" )
    end
  end

  describe "GET 'help'" do
    it "should be successful" do
      get 'help'
      response.should be_success
    end
    it "should have the right title" do
      get 'help'
      response.should have_selector("title", :content => " | Help" )
    end
    
  end

  describe "GET 'legal'" do
    it "should be successful" do
      get 'legal'
      response.should be_success
    end
    it "should have the right title" do
      get 'legal'
      response.should have_selector("title", :content => " | Terms of Use" )
    end
    
  end
  
  describe "GET 'privacy'" do
    it "should be successful" do
      get 'privacy'
      response.should be_success
    end
    it "should have the right title" do
      get 'privacy'
      response.should have_selector("title", :content => " | Privacy Policy" )
    end
    
  end
  

end
