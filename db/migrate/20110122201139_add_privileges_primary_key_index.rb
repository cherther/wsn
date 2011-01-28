class AddPrivilegesPrimaryKeyIndex < ActiveRecord::Migration
  def self.up
    add_index :privileges, [:user_id, :catalog_id, :role_id], :unique => true
  end

  def self.down
    remove_index :privileges, [:user_id, :catalog_id, :role_id]
  end
end
