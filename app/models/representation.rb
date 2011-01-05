# == Schema Information
# Schema version: 20101229224600
#
# Table name: representations
#
#  id                   :integer(4)      not null, primary key
#  content_id           :integer(4)      not null
#  rights_type_id       :integer(4)      not null
#  representation_share :decimal(28, 4)  not null
#  created_at           :datetime
#  updated_at           :datetime
#  created_by_user_id   :integer(4)
#  updated_by_user_id   :integer(4)
#

class Representation < ActiveRecord::Base
  
  belongs_to :content
  
  has_and_belongs_to_many :territories
  
  attr_accessible :rights_type_id, :representation_share, 
  :created_by_user_id, :updated_by_user_id
  
end
