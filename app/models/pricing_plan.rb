# == Schema Information
# Schema version: 20101229224600
#
# Table name: pricing_plans
#
#  id                       :integer(4)      not null, primary key
#  pricing_plan_name        :string(255)     not null
#  promo_message            :string(255)
#  is_promo                 :binary(255)     default(""), not null
#  is_featured              :binary(255)     default(""), not null
#  is_enabled               :binary(255)     default(""), not null
#  show_on_site             :binary(255)     default(""), not null
#  plan_charge              :decimal(28, 4)
#  plan_recurrance          :string(255)
#  number_of_songs          :integer(4)
#  number_of_invited_users  :integer(4)
#  number_of_catalog_admins :integer(4)
#  custom_contactus         :binary(255)     default(""), not null
#  custom_siteprofile       :binary(255)     default(""), not null
#  created_at               :datetime
#  updated_at               :datetime
#  created_by_user_id       :integer(4)
#  updated_by_user_id       :integer(4)
#

class PricingPlan < ActiveRecord::Base
  has_many :plan_balances
  has_many :subscriptions
end
