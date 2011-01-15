require 'spec_helper'

describe ContentsController do

  render_views

  before(:each) do
    test_sign_in existing_user
  end

  describe "GET 'search'" do
    it "should be successful" do
      get :search
      response.should be_success
    end
    
    it "should have the right title" do
      get :search
      response.should have_selector("title", :content => "Search")
    end
    
  end

  describe "GET 'results'" do
    it "should be successful" do
      get :results, :keyword => 'love'
      response.should be_success
    end
  end

  it "should have the right title" do
    get :results, :keyword => 'love'
    response.should have_selector("title", :content => "Search")
  end

  it "should have a sort by field" do
    get :results, :keyword => 'love'
    response.should have_selector("div", :content => "Sort by")
  end

  describe "GET 'destroy'" do
    it "should be successful" do
      get :destroy
      response.should be_success
    end
  end

end
