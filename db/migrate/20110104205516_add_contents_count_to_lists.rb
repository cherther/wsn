class AddContentsCountToLists < ActiveRecord::Migration
  def self.up
    add_column :lists, :contents_count, :integer
  end

  def self.down
    remove_column :lists, :contents_count
  end
end
