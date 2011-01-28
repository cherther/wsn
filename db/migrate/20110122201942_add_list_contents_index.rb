class AddListContentsIndex < ActiveRecord::Migration
  def self.up
    add_index :contents_lists, [:list_id, :content_id ], :unique => true
  end

  def self.down
    remove_index :contents_lists, [:list_id, :content_id ]
  end
end
