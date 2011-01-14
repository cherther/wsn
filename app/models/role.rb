# == Schema Information
# Schema version: 20101229224600
#
# Table name: roles
#
#  id                 :integer(4)      not null, primary key
#  role_name          :string(255)     not null
#  created_at         :datetime
#  updated_at         :datetime
#  created_by_user_id :integer(4)
#  updated_by_user_id :integer(4)
#

class Role < ActiveRecord::Base
  has_many :users  

  def admin?
    id <= Role::ADMIN
  end
  def super_admin?
    id <= Role::SUPER_ADMIN
  end


# -----------------------
# Enum
# -----------------------
  def self.add_item(key,value)
    @hash ||= {}
    @hash[key]=value
  end

  def self.const_missing(key)
    @hash[key]
  end   

  def self.each
    @hash.each {|key,value| yield(key,value)}
  end

  def self.values
    @hash.values || []
  end

  def self.keys
    @hash.keys || []
  end

  def self.[](key)
    @hash[key]
  end
  
  self.add_item(:SUPER_ADMIN, 1)
  self.add_item(:ADMIN, 2)
  self.add_item(:PLUGGER, 3)
  self.add_item(:CLIENT, 4)
  
end
