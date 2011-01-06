# == Schema Information
# Schema version: 20101229224600
#
# Table name: users
#
#  id                           :integer(4)      not null, primary key
#  user_name                    :string(255)     not null
#  password_hash                :string(255)
#  first_name                   :string(255)
#  last_name                    :string(255)
#  parent_user_id               :integer(4)
#  plan_user_id                 :integer(4)      not null
#  role_id                      :integer(4)      not null
#  site_profile_id              :integer(4)      not null
#  pricing_plan_id              :integer(4)      not null
#  plan_balance_id              :integer(4)      not null
#  invitation_id                :binary(255)
#  registered_on                :datetime        not null
#  signature                    :string(1000)
#  show_debug_info              :binary(255)
#  append_signature_to_title    :binary(255)     default(""), not null
#  has_agreed_to_privacy_policy :binary(255)     default(""), not null
#  has_allowed_communication    :binary(255)     default(""), not null
#  created_at                   :datetime
#  updated_at                   :datetime
#  created_by_user_id           :integer(4)
#  updated_by_user_id           :integer(4)
#

require 'digest'

class User < ActiveRecord::Base
    
    belongs_to :role
    belongs_to :plan_balance
    belongs_to :pricing_plan
    belongs_to :site_profile
    
    belongs_to :invitation
    has_many :invitations, :dependent => :delete_all
    
    has_many :contacts, :dependent => :delete_all
    has_many :default_contacts, :class_name => 'Contact', :conditions => ['is_default = ?', true]
    
    has_many :lists, :dependent => :delete_all
    has_many :subscriptions, :dependent => :destroy
    
    has_many :privileges, :dependent => :delete_all
    has_many :catalogs, :through => :privileges
    
    has_many :invited_users, :class_name => "User", :foreign_key => "parent_user_id"
    belongs_to :parent_user, :class_name => "User"
    
    has_many :plan_members, :class_name => "User", :foreign_key => "plan_user_id"
    belongs_to :plan_user, :class_name => "User"

    	
    #:append_signature_to_title, :has_agreed_to_privacy_policy, :has_allowed_communication
    attr_accessor :password, :password_confirmation#, :new_password, :new_password_confirmation

    attr_accessible :user_name, :password, :password_confirmation, :first_name, :last_name, :signature, :parent_user_id,
    :plan_user_id, :role_id, :site_profile_id, :pricing_plan_id, :plan_balance_id, :invitation_id, :registered_on, :signature,
    	:append_signature_to_title, :has_agreed_to_privacy_policy, :has_allowed_communication, :created_by_user_id, :updated_by_user_id
    
    email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates :user_name, :presence => true, :format   => { :with => email_regex }, :uniqueness => { :case_sensitive => false }
    validates :password, :presence => true, :confirmation => { :if=>:password_changed? }, :length  => { :within => 6..40 }
    validates :plan_user_id, :presence => true
    validates :role_id, :presence => true
    validates :site_profile_id, :presence => true
    validates :pricing_plan_id, :presence => true
    validates :plan_balance_id, :presence => true
    validates :registered_on, :presence => true
    validates :has_agreed_to_privacy_policy, :presence => true
      
    #before_save :encrypt_password

    before_save :hash_new_password, :if=>:password_changed?
    before_save :cleanup
    
    def full_name
      first_name.blank? && last_name.blank? ?  user_name : "#{first_name} #{last_name}".squish
    end
          
    def has_correct_password?(submitted_password)
        # Compare encrypted_password with the encrypted version of
        # submitted_password.
        password_hash == encrypt(submitted_password)
    end
    
    def password_changed?
      !@password.blank?
    end
        
    def self.authenticate(user_name, submitted_password)
        user = find_by_user_name(user_name)
        return nil  if user.nil?
        return user if user.has_correct_password?(submitted_password)
    end

    def self.authenticate_with_salt(id, cookie_salt)
      user = find_by_id(id)
      (user && user.salt == cookie_salt) ? user : nil
    end

    def self.detail(id)
      find(id, :joins => [ :default_contacts, :role, :site_profile, { :plan_balance => :pricing_plan }, { :privileges => :catalog }], 
               :include => [{ :lists => :contents } ])
    end

    def self.list
      find(:all, :joins => [ :role, :pricing_plan ], :include => :parent_user, 
      :order => 'case parent_user_id when null then 0 else parent_user_id end, role_id, pricing_plan_id desc, user_name')      
    end

    private
    
      def cleanup
        self[:user_name] = self[:user_name].downcase
        self[:first_name] = self[:first_name].capitalize unless self[:first_name].blank?
        self[:last_name] = self[:last_name].capitalize unless self[:last_name].blank?
      end
      
      def hash_new_password
          # First reset the salt to a new random string.  You could choose a
          # longer string here but for a salt, 8 bytes of randomness is probably
          # fine.  Note this uses SecureRandom which will use your platform's secure
          # random number generator.
          self.salt = make_salt
          # Now calculate the hash of the password, with the salt prepended, store
          # store that in the database
          self.password_hash = encrypt(password)
      end
        
      #def encrypt_password
      #  self.salt = make_salt if new_record?
      #  self.password_hash = encrypt(password)
      #end

      def encrypt(string)
        secure_hash("#{salt}--#{string}")
      end

      def make_salt
          ActiveSupport::SecureRandom.base64(8)
      #  secure_hash("#{Time.now.utc}--#{password}")
      end

      def secure_hash(string)
        Digest::SHA2.hexdigest(string)
      end
          
end
