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
    response.should have_selector('title', :content => "Log In")
  end

  it "should have a search page at '/search'" do
    get '/search'
    response.should have_selector('title', :content => "Search")
  end

end
