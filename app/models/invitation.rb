# == Schema Information
# Schema version: 20101229224600
#
# Table name: invitations
#
#  id                       :integer(4)      not null, primary key
#  invitation_email_address :string(255)     not null
#  expiration_date          :datetime        not null
#  invitation_status        :integer(2)      not null
#  user_id                  :integer(4)
#  is_plan_invitation       :binary(255)     default(""), not null
#  created_at               :datetime
#  updated_at               :datetime
#  created_by_user_id       :integer(4)
#  updated_by_user_id       :integer(4)
#

class Invitation < ActiveRecord::Base
  belongs_to :user
  has_many :users
  
  attr_accessible :invitation_email_address, :expiration_date, :invitation_status, :user_id, :is_plan_invitation,
  :created_by_user_id, :updated_by_user_id
  
end
