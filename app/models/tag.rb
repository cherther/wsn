# == Schema Information
# Schema version: 20101229224600
#
# Table name: tags
#
#  id                 :integer(4)      not null, primary key
#  tag_name           :string(100)     not null
#  tag_type_id        :integer(4)      not null
#  created_at         :datetime
#  updated_at         :datetime
#  created_by_user_id :integer(4)
#  updated_by_user_id :integer(4)
#

class Tag < ActiveRecord::Base
  has_and_belongs_to_many :contents
  
  attr_accessible :tag_type_id, :tag_name
  
  
  def self.moods
    #tags_grouped = "select t.tag_type_id, t.id, t.tag_name, count(*) as tag_count
    #from tags t inner join contents_tags ct on t.id = ct.tag_id
    #group by t.tag_type_id, t.id, t.tag_name
    #order by t.tag_type_id, count(*) desc"
    Tag.order("tag_type_id, tag_name").where(:tag_type_id => 10)
  end
  def self.styles
    Tag.order("tag_type_id, tag_name").where(:tag_type_id => 11)
  end
  
end
