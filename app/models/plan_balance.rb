# == Schema Information
# Schema version: 20101229224600
#
# Table name: plan_balances
#
#  id                       :integer(4)      not null, primary key
#  pricing_plan_id          :integer(4)      not null
#  number_of_songs          :integer(4)      not null
#  number_of_invited_users  :integer(4)      not null
#  number_of_catalog_admins :integer(4)      not null
#  created_at               :datetime
#  updated_at               :datetime
#  created_by_user_id       :integer(4)
#  updated_by_user_id       :integer(4)
#

class PlanBalance < ActiveRecord::Base
  belongs_to :pricing_plan
  has_many :users
end
