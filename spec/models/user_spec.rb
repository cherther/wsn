require 'spec_helper'

describe User do

  before(:each) do
    @attr = { 
      :user_name => "test_user@test.com", :password => "12345678", :password_confirmation => "12345678", :first_name => "test", :last_name => "myuser",
      :plan_user_id => 1, :role_id => 2, :site_profile_id => 1, :pricing_plan_id => 1, :plan_balance_id => 1, 
      :registered_on => "2010/12/28", :has_agreed_to_privacy_policy => true, 
      :created_by_user_id => 1, :updated_by_user_id => 1 }
  end

  describe "user creation" do
    
    it "should create a new instance given valid attributes" do
      User.create!(@attr)
    end
  
    it "should require a user name" do
      no_name_user = User.new(@attr.merge(:user_name => ""))
      no_name_user.should_not be_valid
    end
  
    it "should accept valid email addresses as user names" do
      addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
      addresses.each do |address|
        valid_email_user = User.new(@attr.merge(:user_name => address))
        valid_email_user.should be_valid
      end
    end

    it "should reject invalid email addresses as user names" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
      addresses.each do |address|
        invalid_email_user = User.new(@attr.merge(:user_name => address))
        invalid_email_user.should_not be_valid
      end
    end

    it "should reject duplicate email addresses" do
     # Put a user with given email address into the database.
     User.create!(@attr)
     user_with_duplicate_email = User.new(@attr)
     user_with_duplicate_email.should_not be_valid
    end

    it "should reject email addresses identical up to case" do
       upcased_email = @attr[:user_name].upcase
       User.create!(@attr.merge(:user_name => upcased_email))
   
       user_with_duplicate_email = User.new(@attr)
       user_with_duplicate_email.should_not be_valid
    end

    it "should not require a first or last name" do
      @attr.delete(:first_name)
      @attr.delete(:last_name)
      no_name_user = User.new(@attr)
      no_name_user.should be_valid
    end

    it "should have a valid full name even if first name is missing" do
      @attr.delete(:first_name)
      full_name_user = User.new(@attr)
      full_name_user.full_name.should == full_name_user.last_name
    end

    it "should have a valid full name even if last name is missing" do
      @attr.delete(:last_name)
      full_name_user = User.new(@attr)
      full_name_user.full_name.should == full_name_user.first_name
    end

    it "should have a valid full name even if first & last name is missing" do
      @attr.delete(:first_name)
      @attr.delete(:last_name)
      full_name_user = User.new(@attr)
      full_name_user.full_name.should == full_name_user.user_name
    end
  
  end
  
  describe "password validation" do
    
     it "should require a password" do
       User.new(@attr.merge(:password => "", :password_confirmation => "")).
         should_not be_valid
     end

     it "should require a matching password confirmation" do
       User.new(@attr.merge(:password_confirmation => "invalid")).
         should_not be_valid
     end

     it "should reject short passwords" do
       short = "a" * 5
       hash = @attr.merge(:password => short, :password_confirmation => short)
       User.new(hash).should_not be_valid
     end

     it "should reject long passwords" do
       long = "a" * 41
       hash = @attr.merge(:password => long, :password_confirmation => long)
       User.new(hash).should_not be_valid
     end
  end

  describe "password encryption" do

    before(:each) do
      @user = User.create!(@attr)
    end

    it "should have an encrypted password attribute" do
      @user.should respond_to(:password_hash)
    end
  
    describe "has_correct_password? method" do

      it "should be true if the passwords match" do
        @user.has_correct_password?(@attr[:password]).should be_true
      end    

      it "should be false if the passwords don't match" do
        @user.has_correct_password?("invalid").should be_false
      end 
    end
  
    describe "authenticate method" do

      it "should return nil on email/password mismatch" do
        wrong_password_user = User.authenticate(@attr[:email], "wrongpass")
        wrong_password_user.should be_nil
      end

      it "should return nil for an email address with no user" do
        nonexistent_user = User.authenticate("bar@foo.com", @attr[:password])
        nonexistent_user.should be_nil
      end

      it "should return the user on email/password match" do
        matching_user = User.authenticate(@attr[:user_name], @attr[:password])
        matching_user.should == @user
      end
    end
  end
  
  describe "detail" do
    
    before(:each) do
      @user_id = 1
    end

    it "should return the correct user" do
        user = User.detail(@user_id)
        user.should_not be_nil
        user.id.should be @user_id
    end

    it "should contain the user's role" do
        user = User.detail(@user_id)
        user.should_not be_nil
        user.role.should_not be_nil
    end

    it "should contain the user's default contact" do
        user = User.detail(@user_id)
        user.should_not be_nil
        user.contacts.should_not be_nil
        user.contacts.count.should == 1
        user.contacts.first.is_default.should == "1"
    end

  end
end
