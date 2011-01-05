# == Schema Information
# Schema version: 20101229224600
#
# Table name: lists
#
#  id                 :integer(4)      not null, primary key
#  user_id            :integer(4)      not null
#  list_name          :string(255)     not null
#  number_items       :integer(4)
#  compressed_size    :decimal(28, 4)
#  archive_name       :string(256)
#  is_last_processed  :binary(255)
#  created_at         :datetime
#  updated_at         :datetime
#  created_by_user_id :integer(4)
#  updated_by_user_id :integer(4)
#

class List < ActiveRecord::Base
  
  belongs_to :user
  
  has_and_belongs_to_many :contents

  attr_accessible :user_id, :list_name, :number_items, :compressed_size, :archive_name, :is_last_processed, 
  :created_by_user_id, :updated_by_user_id
  
end
