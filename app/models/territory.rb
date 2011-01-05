# == Schema Information
# Schema version: 20101229224600
#
# Table name: territories
#
#  id                 :integer(4)      not null, primary key
#  territory_code     :string(50)      not null
#  territory_name     :string(100)     not null
#  created_at         :datetime
#  updated_at         :datetime
#  created_by_user_id :integer(4)
#  updated_by_user_id :integer(4)
#

class Territory < ActiveRecord::Base
  has_and_belongs_to_many :representations
end
