require 'spec_helper'

describe "Users" do

  describe "signup" do

  end

  describe "sign in/out" do

    describe "failure" do
      it "should not sign a user in" do
        visit login_path
        fill_in 'session[user_name]',    :with => ""
        fill_in 'session[password]', :with => ""
        click_button
        #response.should have_selector("div.flash.error", :content => "Invalid")
      end
    end

    describe "success" do
      it "should sign a user in and out" do
        user = Factory(:user)
        user.user_name = 'claus@codewerks.de'
        user.password = 'password'
        
        visit login_path
        fill_in 'session[user_name]',    :with => user.user_name
        fill_in 'session[password]', :with => user.password
        click_button
        #controller.should be_signed_in
        
        click_link "Logout"
        controller.should_not be_signed_in
      end
    end
  end

end