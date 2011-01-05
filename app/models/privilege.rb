# == Schema Information
#
# Table name: privileges
#
#  user_id    :integer(4)      not null
#  catalog_id :integer(4)      not null
#  role_id    :integer(4)      not null
#

class Privilege < ActiveRecord::Base
  
  belongs_to :catalog, :foreign_key => "catalog_id"
  #has_many :catalogs, :through => :privileges
  belongs_to :user, :foreign_key => "user_id"
  #has_many :users, :through => :privileges
  belongs_to :role, :foreign_key => "role_id"
  
  attr_accessible :user_id, :catalog_id, :role_id
  
  validates :user_id, :presence => true
  validates :catalog_id, :presence => true
  validates :role_id, :presence => true
  
end
