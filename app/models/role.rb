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
end
