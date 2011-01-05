require 'spec_helper'


describe CatalogsController do

  render_views

  describe "GET 'index'" do
    
    it "should be successful" do
      get 'index'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'index'
      response.should have_selector("title", :content => "Catalog Management")  
    end
  end

  describe "GET 'show'" do
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "should be successful" do
      get 'edit'
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "should be successful" do
      get 'update'
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "should be successful" do
      get 'destroy'
      response.should be_success
    end
  end

  describe "GET 'upload'" do
    it "should be successful" do
      get 'upload'
      response.should be_success
    end
    it "should have the right title" do
      get 'upload'
      response.should have_selector("title", :content => "Catalog Upload")
    end
  end

end
