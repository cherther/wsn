# == Schema Information
# Schema version: 20101229224600
#
# Table name: subscriptions
#
#  id                      :integer(4)      not null, primary key
#  pricing_plan_id         :integer(4)      not null
#  user_id                 :integer(4)      not null
#  subscription_start_date :datetime        not null
#  subscription_end_date   :datetime
#  plan_charge             :decimal(28, 4)  not null
#  created_at              :datetime
#  updated_at              :datetime
#  created_by_user_id      :integer(4)
#  updated_by_user_id      :integer(4)
#

class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :pricing_plan
end
