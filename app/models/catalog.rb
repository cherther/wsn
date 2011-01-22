# == Schema Information
# Schema version: 20101229224600
#
# Table name: catalogs
#
#  id                 :integer(4)      not null, primary key
#  catalog_name       :string(100)     not null
#  created_at         :datetime
#  updated_at         :datetime
#  created_by_user_id :integer(4)
#  updated_by_user_id :integer(4)
#

class Catalog < ActiveRecord::Base
  
  has_many :contents, :dependent => :delete_all

  has_many :privileges, :foreign_key => "catalog_id"
  has_many :users, :through => :privileges

  attr_accessible :catalog_name, :created_by_user_id, :updated_by_user_id
  

end
