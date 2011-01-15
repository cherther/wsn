require 'spec_helper'

describe "LayoutLinks" do
      
  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end
  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "Contact Us")
  end

  it "should have a Help page at '/help'" do
    get '/help'
    response.should have_selector('title', :content => "Help")
  end

  it "should have a Terms of Use page at '/legal'" do
    get '/legal'
    response.should have_selector('title', :content => "Terms of Use")
  end

  it "should have a Privacy Policy page at '/privacy'" do
    get '/privacy'
    response.should have_selector('title', :content => "Privacy Policy")
  end
      
  it "should have a login page at '/login'" do
    get '/login'
    response.should have_selector('title', :content => "Login")
  end

  it "should have a search page at '/search'" do
    integration_sign_in existing_user
    get '/search'
    response.should have_selector('title', :content => "Search")
  end

  describe "when not signed in" do
    
    it "should have a register link" do
      visit root_path
      response.should have_selector("a", :href => register_path,
                                         :content => "Register")
    end
    
    it "should have a signin link" do
      visit root_path
      response.should have_selector("a", :href => login_path,
                                         :content => "Login")
    end
  end
  describe "when signed in" do
    
    before(:each) do
      integration_sign_in existing_user
    end

    it "should have a signout link" do
      visit root_path
      response.should have_selector("a", :href => logout_path,
                                         :content => "Logout")
    end

    it "should have a profile link" do
          visit root_path
          response.should have_selector("a", #:href => edit_user_path(@user),
                                             :content => "My Profile")
    end
    
    it "should not have a register link" do
      visit root_path
      response.should_not have_selector("a", :href => register_path,
                                            :content => "Register")
    end
  
   end
end
