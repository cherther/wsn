require 'spec_helper'

describe UsersController do

  render_views

  describe "GET 'index'" do
    
    before(:each) do
      test_sign_in existing_user
    end

    it "should be successful" do
      get 'index'
      response.should be_success
    end
    it "should have the right title" do
      get 'index'
      response.should have_selector("title", :content => "User Management")
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'new'
      response.should have_selector("title", :content => "Register")
    end
    
  end

  describe "GET 'create'" do
    it "should be successful" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    before(:each) do
        @user = Factory(:user)
        test_sign_in @user
    end
    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end
    it "should have the right title" do
        get :show, :id => @user
        response.should have_selector("title", :content => "User Detail")
    end
  end

  describe "GET 'edit'" do
    before(:each) do
        @user = Factory(:user)
        test_sign_in @user
    end
    it "should be successful" do
      get :edit, :id => @user
      response.should be_success
    end
    it "should have the right title" do
        get :edit, :id => @user
        response.should have_selector("title", :content => "User Profile")
    end
    it "should find the right user" do
      get :edit, :id => @user
      assigns(:user).should == @user
    end
  end

  describe "PUT 'update'" do
    
    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)
    end
    
    describe "failure" do

      before(:each) do
        @attr = { :user_name => "", :first_name => "", :last_name => "", :password => "",
                  :password_confirmation => "" }
      end

      it "should render the 'edit' page" do
        put :update, :id => @user, :user => @attr
        response.should render_template('edit')
      end

      it "should have the right title" do
        put :update, :id => @user, :user => @attr
        response.should have_selector("title", :content => "User Profile")
      end
    end
    
    describe "success" do

      before(:each) do
        @attr = { :first_name => "New", :last_name => "Name", :user_name => "user@example.org",
                  :password => "barbaz", :password_confirmation => "barbaz" }
      end

      it "should change the user's attributes" do
        put :update, :id => @user, :user => @attr
        @user.reload
        @user.user_name.should  == @attr[:user_name]
        @user.first_name.should == @attr[:first_name]
      end

    end

  end

  describe "GET 'reset'" do
    it "should be successful" do
      get 'reset'
      response.should be_success
    end
    
    it "should have the right title" do
        get 'reset'
        response.should have_selector("title", :content => "Reset Password")
    end
    
  end

  describe "GET 'destroy'" do

    before(:each) do
      test_sign_in existing_user
    end

    it "should be successful" do
      get 'destroy'
      response.should be_success
    end
  end

end
