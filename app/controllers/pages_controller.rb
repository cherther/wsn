class PagesController < ApplicationController

  def home
    @location = "home"
    @title = "Home"
  end
  
  def contact
    @location = "contact"
    @title = "Contact Us"
  end

  def help
    @location = "help"
    @title = "Help"
  end
  
  def legal
    @location = "home"
    @title = "Terms of Use"
  end

  def privacy
    @location = "home"
    @title = "Privacy Policy"
  end
  
end
