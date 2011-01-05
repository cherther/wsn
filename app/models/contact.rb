# == Schema Information
# Schema version: 20101229224600
#
# Table name: contacts
#
#  id                 :integer(4)      not null, primary key
#  user_id            :integer(4)      not null
#  contact_type_id    :integer(4)      not null
#  is_default         :binary(255)     default(""), not null
#  contact_name       :string(100)
#  company_name       :string(100)
#  address_1          :string(100)
#  address_2          :string(100)
#  city               :string(100)
#  state_region       :string(50)
#  postal_code        :string(50)
#  country            :string(50)
#  phone_1            :string(50)
#  phone_2            :string(50)
#  fax                :string(50)
#  email              :string(250)
#  admin_email        :string(250)
#  created_at         :datetime
#  updated_at         :datetime
#  created_by_user_id :integer(4)
#  updated_by_user_id :integer(4)
#

class Contact < ActiveRecord::Base

  belongs_to :user
  
  attr_accessible :contact_name, :company_name, :address_1, :address_2, 
  :city, :state_region, :postal_code, :country, :phone_1, :phone_2,
  :fax, :email, :admin_email, :created_by_user_id, :updated_by_user_id
  
end
