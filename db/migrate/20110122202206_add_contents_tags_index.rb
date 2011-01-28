class AddContentsTagsIndex < ActiveRecord::Migration
  def self.up
    add_index :contents_tags, [:content_id, :tag_id ], :unique => true
  end

  def self.down
    remove_index :contents_tags, [:content_id, :tag_id ]
  end
end
