# == Schema Information
# Schema version: 20101229224600
#
# Table name: site_profiles
#
#  id                   :integer(4)      not null, primary key
#  profile_name         :string(50)      not null
#  company_name         :string(100)     not null
#  contact_address_1    :string(100)     not null
#  contact_address_2    :string(100)
#  contact_city         :string(100)     not null
#  contact_state_region :string(50)      not null
#  contact_postal_code  :string(50)      not null
#  contact_country      :string(50)      not null
#  contact_phone        :string(50)      not null
#  contact_fax          :string(50)
#  contact_email        :string(250)     not null
#  admin_email          :string(250)     not null
#  has_profile_logo     :binary(255)     default(""), not null
#  created_at           :datetime
#  updated_at           :datetime
#  created_by_user_id   :integer(4)
#  updated_by_user_id   :integer(4)
#

class SiteProfile < ActiveRecord::Base
  has_many :users
end
