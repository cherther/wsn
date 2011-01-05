# == Schema Information
# Schema version: 20101229224600
#
# Table name: media
#
#  id                 :integer(4)      not null, primary key
#  content_id         :integer(4)      not null
#  media_version      :integer(4)      not null
#  media_date         :datetime        not null
#  is_remote          :binary(255)     default(""), not null
#  media_type         :string(5)
#  media_bitrate      :integer(4)
#  media_size         :integer(8)
#  media_length       :integer(8)
#  created_at         :datetime
#  updated_at         :datetime
#  created_by_user_id :integer(4)
#  updated_by_user_id :integer(4)
#

class MediaFile < ActiveRecord::Base
  set_table_name "media" 
  belongs_to :content
end
